//
//  ViewController.swift
//  StarReviewDemo
//
//  Created by Tyrant on 12/4/15.
//  Copyright © 2015 Qfq. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    var star:StarReview?
    var slider:UISlider?
    var lblStarLevel:UILabel?
    var txtStarValue:UITextField?
    var btnBarLeft:UIBarButtonItem?
    var colors = UIColor.allStarColor()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //setup first star view
        star                    = StarReview(frame: CGRect(x: 15, y: 100, width: 200, height: 50))
        star?.starMarginScale   = 0.4;
        star!.value             = 2
        star?.starCount         = 6
        star?.allowAccruteStars = true
        star!.addTarget(self, action: #selector(ViewController.valueChange(_:)), for: UIControl.Event.valueChanged)
        view.addSubview(star!)
        
        //setup lable for present first star view's value
        lblStarLevel            = UILabel(frame: CGRect(x: 0, y: 180, width: 200, height: 20))
        lblStarLevel?.textColor = UIColor.black
        lblStarLevel?.text      = "分数值\(star!.value)"
        view.addSubview(lblStarLevel!)
        
        //setup slider which work in coordination with first star view
        slider               = UISlider(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 50))
        slider?.maximumValue = Float(star!.starCount)
        slider?.minimumValue = 0
        slider?.addTarget(self, action: #selector(ViewController.sliderChangeValue(_:)), for: UIControl.Event.valueChanged)
        view.addSubview(slider!)
        
        //setup text view used for set first star view's value
        txtStarValue                    = UITextField(frame: CGRect(x: 230, y: 175, width: 100, height: 30))
        txtStarValue?.keyboardType      = UIKeyboardType.decimalPad
        txtStarValue?.delegate          = self;
        txtStarValue?.layer.borderWidth = 0.5
        txtStarValue?.placeholder       = "Set value"
        txtStarValue?.layer.borderColor = UIColor.red.cgColor
        view.addSubview(txtStarValue!)
        
        //setup second star view
        let star2                 = StarReview(frame: CGRect(x: 15, y: 250, width: 150, height: 70))
        star2.starCount           = 5
        star2.value               = 1
        star2.allowAccruteStars   = true
        star2.starFillColor       = UIColor.red
        star2.starBackgroundColor = UIColor.black
        star2.starMarginScale     = 0.3
        view.addSubview(star2)
        
        //setup third star view
        let star3                 = StarReview(frame: CGRect(x: 15, y: 320, width: 150, height: 70))
        star3.starCount           = 5
        star3.allowAccruteStars   = true
        star3.starMarginScale     = 0.5
        star3.value               = 3.3
        star3.starBackgroundColor = UIColor.lightGray
        star3.starFillColor       = UIColor.orange
        view.addSubview(star3)
        
        //setup button for change star color
        let btnBar = UIBarButtonItem(title: "换色", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ViewController.changeColor))
        navigationItem.rightBarButtonItem = btnBar
        
        //setup button for change star value between integer and non-integer.
        btnBarLeft = UIBarButtonItem(title: "整数化", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ViewController.inter))
        navigationItem.leftBarButtonItem = btnBarLeft!

    }

    @objc func valueChange(_ sender:StarReview){
        slider?.value = sender.value
        lblStarLevel?.text = "分数值\(sender.value)"
    }
    
    @objc func changeColor(){
        let index = Int(arc4random()) % colors.count
        star!.starFillColor = colors[index]
    }
    
    @objc func sliderChangeValue(_ sender:UISlider){
        print("SliderValue:\(sender.value)")
        star!.value = sender.value
    }
    
    @objc func inter(){
        star?.allowAccruteStars = !star!.allowAccruteStars
        btnBarLeft?.title = star!.allowAccruteStars ? "非整数化" : "整数化"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let value:NSString = textField.text as NSString?{
            star?.value = value.floatValue
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtStarValue?.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension UIColor {
    static func allStarColor()->[UIColor]{
        return [UIColor.red,UIColor.black,UIColor.blue,UIColor.brown,UIColor.white,UIColor.orange,UIColor.purple,UIColor.gray,UIColor.lightGray,UIColor.lightText,UIColor.darkGray,UIColor.darkText,UIColor.cyan,UIColor.yellow,UIColor.magenta,UIColor.clear]
    }
    static  func starColorFromString(_ color:String)->UIColor{
        var colorString = (color as NSString).trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased() as NSString
        if colorString.length < 3{
            return UIColor.clear
        }
        if colorString.hasPrefix("0X"){
            colorString = colorString.substring(from: 2) as NSString
        }
        if colorString.hasPrefix("#")
        {
            colorString = colorString.substring(from: 1) as NSString
        }
        var alpha:CGFloat = 1.0
        var red:CGFloat = 0
        var green:CGFloat = 0
        var blue:CGFloat = 0
        switch colorString.length{
        case 3:
            red = starColorComponentFrom(colorString, start: 0, length: 1)
            green = starColorComponentFrom(colorString, start: 1, length: 1)
            blue = starColorComponentFrom(colorString, start: 2, length: 1)
        case 4:
            alpha = starColorComponentFrom(colorString, start: 0, length: 1)
            red = starColorComponentFrom(colorString, start: 1, length: 1)
            green = starColorComponentFrom(colorString, start: 2, length: 1)
            blue = starColorComponentFrom(colorString, start: 3, length: 1)
        case 6:
            red = starColorComponentFrom(colorString, start: 0, length: 2)
            green = starColorComponentFrom(colorString, start: 2, length: 2)
            blue = starColorComponentFrom(colorString, start: 4, length: 2)
        case 8:
            alpha = starColorComponentFrom(colorString, start: 0, length: 2)
            red = starColorComponentFrom(colorString, start: 2, length: 2)
            green = starColorComponentFrom(colorString, start: 4, length: 2)
            blue = starColorComponentFrom(colorString, start: 6, length: 2)
            
        default: return UIColor.clear
        }
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
func starColorComponentFrom(_ str:NSString,start:UInt,length:UInt)->CGFloat{
    let subStr = str.substring(with: NSMakeRange(Int(start), Int(length)))
    let fullHex = length == 2 ? subStr: NSString(format: "%@%@", subStr,subStr) as String
    let hexComponent:UnsafeMutablePointer<UInt32>? =  nil
    Scanner(string: fullHex as String).scanHexInt32(hexComponent)
    return CGFloat(hexComponent!.pointee as UInt32) / CGFloat(255.0)
}

