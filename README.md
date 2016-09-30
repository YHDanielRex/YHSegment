# YHSegment
	一个采用Swift封装的简易分段视图选择器

###集成YHSegment###
###导入###
- 方式一: 手动导入
	- 将YHSegment文件夹中的YHSegment.swift添加到项目中

- 方式二: cocoapods导入
	- pod 'YHSegment'

> 由于自定制segment比较简单，文件内容比较小, 建议手动导入项目中, 方便用户修改以适应用户项目

###创建###
- 代码创建, 目前未采用xib的形式创建, 由于创建简单，属性少, 代码简洁, 所以建议采用代码的形式进行编写。
- 通过items创建segment对象, 设置frame，若需要使得segment左右滑动，可设置contentOfSet的大小, 超出frame可左右滑动
- 将YHSegment对象添加到当前view上, 设置相应需要的属性

> 创建方式采用YHSegmented(items:)的方式进行创建, 随后再设置其frame, 其余属性均有默认值, 用户可自行设置其对应的属性值, 以便适应项目需求

- YHSegment可调用的方法及属性
	1. 内容视图的大小, 若需要segment可左右滑动, 可设置该属性超出视图的frame
	2. 设置选中的segment的颜色值
	3. 设置未选中的segment的颜色值
	4. 设置segment整体的背景颜色
	5. 设置是否显示segment下方的滑块，实现动态点击的效果
	6. 点击方法的实现, 可以采用闭包实现方式实现, 同时也可以采用add(target: action:)实现segment选择的点击
效果演示：
		- 可左右滑动的segment

		![B32D24CC-AF4A-4148-873C-8068129591A9.png](/Users/yanhong/Desktop/B32D24CC-AF4A-4148-873C-8068129591A9.png)

		- 不可左右滑动的segment

		![AAF4DEC3-D046-4C71-A5FB-6C582242BA5C.png](/Users/yanhong/Desktop/AAF4DEC3-D046-4C71-A5FB-6C582242BA5C.png)



