//
//  YHSegmented.swift
//  Swift_CustomControl
//
//  Created by 颜洪 on 16/9/26.
//  Copyright © 2016年 颜洪. All rights reserved.
//

import UIKit

typealias segmentClick = (_ index: NSInteger) -> Void

class YHSegmented: UIScrollView {
    
    //MARK: 属性的设置
    // 设置选中分段的下标
    var selectedSegmentIndex: NSInteger = 0 {
        
        // 监听选中下标的变化
        didSet {
            
            self.setSelectedButton()
        }
    }
    
    // 设置选中的颜色
    var selectedSegmentColor: UIColor = UIColor.orange
    
    // 设置未选中的颜色
    var normalSegmentColor: UIColor = UIColor.black
    
    // 是否显示滑块
    var isShowSliderView: Bool = true
    
    // 是否显示线条
    var isShowLine: Bool = true
    
    // 点击回调block
    var clickBlock: segmentClick?
    
    
    //MARK:私有属性
    private var BUTTON_TAG: NSInteger = 100
    private var items: [String]? // 下标数组
    private var target: AnyObject?  // 响应消息的对象
    private var action: Selector?  // 响应的消息
    private var sliderView: UIView? // 滑块
    private var line: UIView? // 线条
    
    //MARK: 初始化视图对象
    // 通过item创建segmentControl对象
    init(items: [String]) {
        super.init(frame: CGRect.zero)
        self.items = items
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 界面布局
    override func layoutSubviews() {
        
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        
        // 创建按钮
        self.createButton()
        
        // 设置按钮为选中状态
        self.setSelectedButton()
    }
    
    func createButton() {
        
        // 创建按钮
        // 宽度
        var width = NSInteger(self.contentSize.width / CGFloat((self.items?.count)!))
        // 高度
        var height = NSInteger(self.contentSize.height)
        
        if self.contentSize.width < self.frame.size.width {
            
            width = NSInteger(self.frame.size.width / CGFloat((self.items?.count)!))
            height = NSInteger(self.frame.size.height)
        }
        
        var i: NSInteger = 0
        for title in self.items! {
            
            // x坐标
            let X = width * i
            // 创建button
            let button: UIButton = UIButton(frame: CGRect(x: X, y: 0, width: width, height: height))
            // 设置button的属性
            button.setTitle(title, for: UIControlState.normal)
            self.addSubview(button)
            button.setTitleColor(self.normalSegmentColor, for: UIControlState.normal)
            button.setTitleColor(self.selectedSegmentColor, for: UIControlState.selected)
            
            button.tag = BUTTON_TAG + i
            // 添加事件
            button.addTarget(self, action: #selector(onclicked(sender:)), for: UIControlEvents.touchUpInside)
            
            i += 1
        }
        
        if isShowSliderView && self.sliderView == nil {
            
            self.sliderView = UIView.init(frame: CGRect(x: 25, y: height - 3, width: width - 50, height: 3))
            self.sliderView?.backgroundColor = self.selectedSegmentColor
            self.addSubview(self.sliderView!)
        }
        
        if isShowLine && self.line == nil {
            
            self.line = UIView.init(frame: CGRect(x: 0, y: height - 1, width: Int(width  * (self.items?.count)!), height: 1))
            self.line?.backgroundColor = self.selectedSegmentColor
            self.addSubview(self.line!)
        }
    }
    //MARK: 点击事件
    // 事件
    func onclicked(sender: UIButton) -> Void {
        
        // 选中下标拿到当前选中的按钮
        let selectedButton: UIButton = self.viewWithTag(self.selectedSegmentIndex + BUTTON_TAG) as! UIButton
        selectedButton.isSelected = false
        selectedButton.isUserInteractionEnabled = true
        
        // 设置点击按钮为选中状态
        self.selectedSegmentIndex = sender.tag - BUTTON_TAG
        
        // 选中下标的值发生改变, 让响应的对象去响应消息
        if let tar = self.target {
            if tar.responds(to: self.action) {
                
                tar.performSelector(inBackground: self.action!, with: self)
            }
            else {
                
                print("事件未实现")
            }
        }
        
        // 点击事件的实现
        if let block = self.clickBlock {
            
            block(self.selectedSegmentIndex)
        }
    }
    
    func add(target: AnyObject, action: Selector) -> Void {
        
        self.target = target
        self.action = action
    }
    
    func setSelectedButton() {
        
        // 将选中下标对应的按钮设置成选中状态
        let button: UIButton = self.viewWithTag(self.selectedSegmentIndex + BUTTON_TAG) as! UIButton
        // 设置成选中状态
        button.isSelected = true
        // 关闭用户交互
        button.isUserInteractionEnabled = false
        
        // 设置滑块
        UIView.animate(withDuration: 0.3) {
            
            self.sliderView?.center = CGPoint(x: button.center.x, y: (self.sliderView?.center.y)!)
        }
    }
}
