# StarReview
=== 
#####下面有中文说明
##StarReview is a iOS Rate tool. it use common star to rate something

StarReview is a powerful iOS UI tool. It is a UIControl subclass that creates a customizable rating view containing rating stars in it. 

##Key Features
* Self-adaptive size. the view size and star count determine the star size.
* Can add any star count.
* Set the star fill color and background color.
* Custom star gap.
* Use float or int to present star value.
* Change star value will fire event when you add target.

##Requirements 

Xcode 7.1 and iOS 8.0(the lasted swift grammar)

##Installation
`if you want to use cocopods, just pod 'StarReview'.`
`if you want to use file, just pod copy the StarReview.swift to your project .`
<br>


##How To Use It 
*Please see these code below
```swift
let star = StarReview(frame: CGRect(x: 15, y: 100, width: 200, height: 50)) //init the StarReview
```
```swift
star.starMarginScale = 0.3 //set the gap/star diameter scale the default value is 0.3
```
```
star.value = 2 //set the StarReview init value
```
```
star.starCount = 5 // set the StarReview star count, the default value = 5
```
```
star.allowEdit = true // set the user can rate  the defalut value is true
```
```
star.allowAccruteStars = true //set whether use float or int to present star value

```
```
star.starFillColor = UIColor.orangeColor() //the star fill color
```
```
star.starBackgroundColor = UIColor.lightGrayColor() //the star background color
```
```
star.addTarget(self, action: "valueChange:", forControlEvents: UIControlEvents.ValueChanged) // add the star value change event
```
```
view.addSubview(star) //add the StarReview
```
*Check the demo project will help you understand more 

<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/1.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/2.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/3.gif)


##Contact 
Any issue or problem please contact me:3421902@qq.com, I will be happy fix it




#中文说明


# StarReview
=== 
##StarReview是一个IOS打分工具，用星星来给某些东西打分

StarReview是一个强大的IOS UI 工具他继承了UIControl 并提供了可定制的包含星星的VIew. 

##关键特点
* 可自适配大小，星的大小由VIew的大小和星星的个数决定
* 可设定任意星星的个数
* 可设定填充颜色和背景色
* 自定义星与星之间的间距
* 可用小数或者整数来表示当前星的分数
* 改变星的值时会触发事伯，当你添加target时

##系统要求 

Xcode 7.1 and iOS 8.0(最新的Swift语法)

##安装
`如果你使用cocopods, 则pod 'StarReview' 再安装即可.`
<br/>
`如果你想使用文件，直接拷贝StarReview.swift到你的项目即可`
<br>


##怎么使用
*请参考以下代码 
```swift
let star = StarReview(frame: CGRect(x: 15, y: 100, width: 200, height: 50)) //初始化 StarReview
```
```swift
star.starMarginScale = 0.3 //设置星与星的间隔长度和星星直径的比例，默认是 0.3
```
```
star.value = 2 //设置 StarReview 的 value
```
```
star.starCount = 5 // 设置StarReview内星星的个数,默认是5个
```
```
star.allowEdit = true // 设置是否可以允许打分，默认是允许
```
```
star.allowAccruteStars = true //设置是否精确化打分，也就是说如果是精确化，就可以用小数，不然只能用整数

```
```
star.starFillColor = UIColor.orangeColor() //设置星星的填充颜色
```
```
star.starBackgroundColor = UIColor.lightGrayColor() //设置星星的背景色
```
```
star.addTarget(self, action: "valueChange:", forControlEvents: UIControlEvents.ValueChanged) // 为StarReview的值改变时添加事件
```
```
view.addSubview(star) //添加StarReview
```
*Check the demo project will help you understand more 

<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/1.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/2.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/3.gif)


##和我联系
任何问题或者BUG请直接和我联系3421902@qq.com, 我会乐于帮你解决
