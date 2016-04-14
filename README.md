# StarReview
=== 

##StarReview is a iOS Rate tool. it use common star to rate something【StarReview是一个IOS打分工具，用星星来给某些东西打分】

StarReview is a powerful iOS UI tool. It is a UIControl subclass that creates a customizable rating view containing rating stars in it. 
【StarReview是一个强大的IOS UI 工具他继承了UIControl 并提供了可定制的包含可打分星星的VIew.】
##Key Features
* Self-adaptive size. the view size and star count determine the star size.**可自适配大小，星的大小由VIew的大小和星星的个数决定**
* Can add any star count.**可设定任意星星的个数**
* Set the star fill color and background color.**可设定填充颜色和背景色**
* Custom star gap.**自定义星与星之间的间距**
* Use float or int to present star value.**可用小数或者整数来表示当前星的分数**
* Change star value will fire event when you add target-action.**改变星的值时会触发事件，当你为它添加target action时**

##Requirements 【系统需要】

Xcode 7.1 and iOS 8.0(the lasted swift grammar)
【Xcode 7.1 and iOS 8.0(最新的Swift语法)】
##Installation 【安装】
+ if you want to use Cocoapods, just pod 'StarReview'**如果你想用Cocoapods,那再pod 'StarReview' 就行**
+ if you want to use file, just pod copy the StarReview.swift to your project .**如果你想使用文件 直接拷贝StarReview.swift文件到你的项目里面就行**
<br>


##How To Use It 【怎么使用】
Please see these code below**请参考下面的代码**
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
Check the demo project will help you understand more 
**参考Demo项目的代码会更好理解**
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/1.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/2.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/3.gif)


##Contact 
Any issue or problem please contact me:3421902@qq.com, I will be happy fix it
**任何问题或者BUG请直接和我联系3421902@qq.com, 我会乐于帮你解决**

