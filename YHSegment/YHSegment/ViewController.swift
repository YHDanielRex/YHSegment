//
//  ViewController.swift
//  YHSegment
//
//  Created by 颜洪 on 16/9/27.
//  Copyright © 2016年 颜洪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.lightGray
        
        self.createSegment()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: 创建segment
    func createSegment() {
        
        // 通过items创建视图选择器
        let segment: YHSegmented = YHSegmented(items: ["标题1", "标题2", "标题3"])
//        , "标题4", "标题5", "标题6", "标题7", "标题8", "标题9"])
        // 设置segment的frame
        segment.frame = CGRect(x: 0, y: 320, width: self.view.frame.size.width, height: 44)
        // 设置内容视图的大小, 超出frame可左右滑动
//        segment.contentSize = CGSize(width: 2 * self.view.frame.size.width, height: 44)
        self.view.addSubview(segment)
        // 添加点击事件
        segment.add(target: self, action: #selector(clickSegment(sender:)))
        // 设置选中的颜色
        segment.selectedSegmentColor = UIColor.white
        // 设置背景颜色
        segment.backgroundColor = UIColor.init(colorLiteralRed: 29.0 / 255, green: 170.0 / 255, blue: 251.0 / 255, alpha: 1)
        // 设置未选中的颜色
        segment.normalSegmentColor = UIColor.init(colorLiteralRed: 165.0 / 255, green: 217.0 / 255, blue: 253.0 / 255, alpha: 1)
        // 采用block的方式进行点击方法的实现
        //        segment.clickBlock = { (index) in
        //
        //            print("点击了第\(index)个按钮")
        //        }
    }
    func clickSegment(sender: YHSegmented) {
        
        print("点击了第\(sender.selectedSegmentIndex)张图片")
    }
}

