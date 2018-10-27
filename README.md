# StarReview

#### 更新到swift4.2

## 【StarReview是一个IOS打分工具，用星星来给某些东西打分】

【StarReview是一个强大的IOS UI 工具他继承了UIControl 并提供了可定制的包含可打分星星的VIew.】
## Key Features
* **可自适配大小，星的大小由VIew的大小和星星的个数决定**
* **可设定任意星星的个数**
* **可设定填充颜色和背景色**
* **自定义星与星之间的间距**
* **可用小数或者整数来表示当前星的分数**
* **改变星的值时会触发事件，当你为它添加target action时**

## 【系统需要】
兼容iOS 8 以上

## 【安装】
+ **如果你想用Cocoapods,那再pod 'StarReview' 就行**
+ **如果你想使用文件 直接拷贝StarReview.swift文件到你的项目里面就行**
<br>

## 【怎么使用】
**请参考下面的代码**
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

**参考Demo项目的代码会更好理解**
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/1.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/2.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/3.gif)


## Contact 

**任何问题或者BUG请直接和我联系3421902@qq.com, 我会乐于帮你解决**

