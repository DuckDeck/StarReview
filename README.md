# StarReview
===
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
```let star = StarReview(frame: CGRect(x: 15, y: 100, width: 200, height: 50)) //init the StarReview
```
```star.starMarginScale = 0.3 //set the gap/star diameter scale the default value is 0.3
```
```star.value = 2 //set the StarReview init value
```star.starCount = 5 // set the StarReview star count, the default value = 5
```star.allowEdit = true // set the user can rate  the defalut value is true
```star.allowAccruteStars = true //set whether use float or int to present star value
```star.starFillColor = UIColor.orangeColor() //the star fill color
```star.starBackgroundColor = UIColor.lightGrayColor() //the star background color
```star.addTarget(self, action: "valueChange:", forControlEvents: UIControlEvents.ValueChanged) // add the star value change event

*Check the demo project will help you understand more 
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/Resource/1.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/Resource/2.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/Resource/3.gif)


##Contact 
Any issue or problem please contact me:3421902@qq.com, I will be happy fix it

