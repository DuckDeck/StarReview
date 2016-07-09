//
//  StarReview.swift
//  StarReviewDemo
//
//  Created by Tyrant on 12/4/15.
//  Copyright © 2015 Qfq. All rights reserved.
//

import UIKit
public final class StarReview: UIControl {
   public var starCount:Int = 5{ //可以用来打分的星星的数量
        didSet{
            maxmunValue = Float(starCount) //再设最大值
            setNeedsDisplay()
        }
    }
    public var starFillColor:UIColor = UIColor.blueColor(){ //星星的填充颜色
        didSet{
            setNeedsDisplay()
        }
    }
  public var starBackgroundColor:UIColor = UIColor.grayColor(){
        didSet{
            setNeedsDisplay()
        }
    }
   public var allowEdit:Bool = true
    public var allowAccruteStars:Bool = false{
        didSet{
            setNeedsDisplay()
        }
    }
 public    var starMarginScale:Float = 0.3{
        didSet{
            if starMarginScale > 0.9
            {
                starMarginScale = 0.9
            }
            if starMarginScale < 0.1{
                starMarginScale = 0.1
            }
            setNeedsDisplay()
        }
    }
   public var value:Float {
        get{
            if allowAccruteStars{
                let index = getStarIndex()
                if index.0 != -1{  //如果是在星上
                    let a = Float((1 + starMarginScale) * Float(starRadius) * (Float(index.0) - 1)) //按下的那颗星开始的坐标点
                    return  (Float(starPixelValue * (1 + starMarginScale) * starRadius) - a) / Float(starRadius) + Float(index.0) - 1
                }
                else{ //如果不在星上
                    return Float(index.1 + 1)
                }

            }
            else{
                return starPixelValue
            }
        }
        set{
            if newValue > Float(starCount){
                starPixelValue  = Float(starCount)
            }
            else  if newValue < 0{
                starPixelValue  = 0
            }
            else{
                if allowAccruteStars{
                    //starValue  = CGFloat(newValue - 0.08) //这样不精确 需要将值进行转化,虽然这两者很相近,想并不相等
                    //先取出整数部分
                    let intPart = Int(newValue)
                    //取出小数部分
                    let floatPart = newValue - Float(intPart)
                    //转化成坐标点
                    let x = (1 + starMarginScale) * starRadius * Float(intPart) + starRadius * Float(floatPart)
                    //坐标转化成 starValue
                    starPixelValue = x / starRadius / (1 + starMarginScale)
                }
                else{
                    starPixelValue = Float(lroundf(newValue))
                }
            }

        }
    }
   public var maxmunValue:Float = 5{
        didSet{
            setNeedsDisplay()
        }
    }
  public  var minimunValue:Float = 0{
        didSet{
            setNeedsDisplay()
        }
    }
    
    private var starRadius:Float = 0.0; //表示Star的大小,其实也就是半径
    private weak var target:AnyObject?
    private var selector:Selector?
    private var event:UIControlEvents?
    
    private var offsetX:Float{
        get{
        //    return ratio > startReviewWidthScale ? Float(self.frame.width) / 2 - startReviewWidthScale / 2 * Float(self.frame.height) + Float(layer.borderWidth) : Float(layer.borderWidth)  //左边的空白处
            return ratio > startReviewWidthScale ? Float(self.frame.width) / 2 - startReviewWidthScale / 2 * Float(self.frame.height)  : 0.0  //左边的空白处
        }
    }
    
    private var offsetY:Float{
        get{
            return ratio < startReviewWidthScale ? (Float(self.frame.height)  - starRadius) / 2 : 0.0  //上面的空白处
        }
    }
    
    private var ratio:Float{ //长宽比
        get{
            return Float(self.frame.width) / Float(self.frame.height)
        }
    }
    private var startReviewWidthScale:Float{  //这个是5个星星们的长宽比.
        get {
            return Float(starCount) + Float((starCount - 1)) * starMarginScale
        }
    }
    
    private var starPixelValue:Float = 0.0{
        didSet{
            if starPixelValue > Float(starCount){
                starPixelValue = Float(starCount)
            }
            if starPixelValue < 0{
                starPixelValue = 0
            }
            setNeedsDisplay()
            if target != nil && event != nil{
                if event == UIControlEvents.ValueChanged{
                    self.sendAction(selector!, to: target, forEvent: nil)
                }
            }
            
        }

    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(){
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        self.backgroundColor = UIColor.clearColor()
        self.userInteractionEnabled = true
        starRadius = Float(self.frame.size.height) - Float(layer.borderWidth * 2)
        if ratio < startReviewWidthScale{
            starRadius = Float(self.frame.width) / startReviewWidthScale - Float(layer.borderWidth * 2)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        self.userInteractionEnabled = true
        starRadius = Float(self.frame.size.height) - Float(layer.borderWidth * 2)
        if ratio < startReviewWidthScale{
            starRadius = Float(self.frame.width) / startReviewWidthScale - Float(layer.borderWidth * 2)
        }
    }
    override public func drawRect(rect: CGRect) {
        //对于View的尺寸是有要求的,如果过长,那么5颗星排起来也排不满整个长度,如果太高的话,那么又占不了整个高度,如果一个星是正文形,长宽都是1的话,那么总长宽比可以是
        //所以可以计算一下应该取多少
        clipsToBounds = false
         starRadius = Float(self.frame.size.height) - Float(layer.borderWidth * 2)
        if ratio < startReviewWidthScale{
            starRadius = Float(self.frame.width) / startReviewWidthScale - Float(layer.borderWidth * 2)
        }
//        print("startReviewWidthScale\(startReviewWidthScale)")
//        print("offsetX:\(offsetX)")
//        print("offsetY:\(offsetY)")
        let ctx = UIGraphicsGetCurrentContext()
        for s in 0...(starCount-1){
            let x = starMarginScale * Float(s) * starRadius + starRadius * (0.5 + Float(s))
            var starCenter = CGPoint(x: CGFloat(x), y: (self.frame.height) / 2) //第个星的中心
            if ratio > startReviewWidthScale{
                starCenter = CGPointMake(CGFloat(x)+CGFloat(offsetX), self.frame.height / 2)
            }
            //print("第\(s)个星的中心x:\(starCenter.x) y:\(starCenter.y)")
            let radius = starRadius / 2 //半径
            //print("星圆的半径:\(radius)")
            let p1 = CGPointMake(starCenter.x, starCenter.y - CGFloat(radius)) //
            
            CGContextSetFillColorWithColor(ctx, starBackgroundColor.CGColor)
            CGContextSetStrokeColorWithColor(ctx, starBackgroundColor.CGColor)
            CGContextSetLineCap(ctx, CGLineCap.Butt)
            CGContextMoveToPoint(ctx, p1.x, p1.y)
            let angle = Float(4 * M_PI / 5)
            for i in 1...5{
                let x = Float(starCenter.x) - sinf(angle * Float(i)) * Float(radius)
                let y = Float(starCenter.y) - cosf(angle * Float(i)) * Float(radius)
                CGContextAddLineToPoint(ctx, CGFloat(x), CGFloat(y))
            }
            CGContextDrawPath(ctx, CGPathDrawingMode.FillStroke)
        }
        CGContextSetFillColorWithColor(ctx, starFillColor.CGColor)
        CGContextSetBlendMode(ctx, CGBlendMode.SourceIn)
//        print(offsetX)
//        print(level)
//        print(starValue)
//        print(starValue * starLength * ( 1 + gapStarLengthScale))
//        print(starLength)
//        print(gapStarLengthScale * starLength)
            let temp = starRadius * ( 1 + starMarginScale) * starPixelValue
           CGContextFillRect(ctx, CGRectMake(CGFloat(offsetX), CGFloat(offsetY), CGFloat(temp), CGFloat(starRadius)))
    }
    
    override public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch:UITouch = touches.first{
            let point = touch.locationInView(self)
            let temp = (Float(point.x) - offsetX) / (starRadius * ( 1 + starMarginScale))
            if allowAccruteStars{
                 starPixelValue = temp
            }
            else{
               starPixelValue = Float(Int(temp) + 1)
            }
           // print("starPicelValue:\(starPixelValue)")
        }
    }
    
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !allowEdit
        {
            return
        }
        if let touch:UITouch = touches.first{
            let point = touch.locationInView(self)
            let temp = (Float(point.x) - offsetX) / (starRadius * ( 1 + starMarginScale))
            if allowAccruteStars{
               starPixelValue = temp
            }
            else{
                 starPixelValue = Float(Int(temp) + 1)
            }
           // print("starPicelValue:\(starPixelValue)")
        }
    }
    override public func addTarget(target: AnyObject?, action: Selector, forControlEvents controlEvents: UIControlEvents) {
        self.target = target
        self.selector = action
        self.event = controlEvents
    }
    
    private func getStarIndex()->(Int,Int){  //判断坐标在第几个星上,如果不在星上,返回在第几个间隙上
        let i = Int(starPixelValue)
        if  starPixelValue - Float(i) <= 1 / (1 + starMarginScale)
        {
            return (i + 1,-1)
        }
        else{
            return (-1, i)
        }
    }
}












