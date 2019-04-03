//
//  ViewController.swift
//  HW1
//
//  Created by KaiHao  on 2019/3/29.
//  Copyright © 2019 NTUST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outL: UILabel! //output label
    @IBOutlet weak var opL: UILabel! //operator label
    
    var ans = 0.0
    var op : String = ""
    var num1 : Double? = nil
    var num2 : Double? = nil
    var prevKey : Int = 0 //紀錄上一個按下的按鍵類型。 0:等號。1:數字。2:加減乘除。
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        outL.text = "0"
        opL.text = ""
    }
    
    // operotor button click
    // connect to + - * /
    @IBAction func opBclick(_ sender: UIButton) {
        if (prevKey == 0) 
        { //0:等號。
            num1 = ans
            num2 = nil
            prevKey = 2
        }
        else if (prevKey == 1) 
        {//1:數字。
            if(num1 == nil && num2 == nil)
            {
                num1 = Double(outL.text!)!
            }
            else if(num1 != nil && num2 == nil)
            {
                num2 = Double(outL.text!)!            
                switch op {
                case "+":
                    ans = num1! + num2!
                case "-":
                    ans = num1! - num2!
                case "×":
                    ans = num1! * num2!
                case "÷":
                    ans = num1! / num2!
                default:
                    break
                }
                outL.text = String(ans)
            }
            else if(num1 != nil && num2 != nil)
            {
                num1 = ans
                num2 = Double(outL.text!)!            
                switch op {
                case "+":
                    ans = num1! + num2!
                case "-":
                    ans = num1! - num2!
                case "×":
                    ans = num1! * num2!
                case "÷":
                    ans = num1! / num2!
                default:
                    break
                }
                outL.text = String(ans)
            }

            prevKey = 2
        }
        else if (prevKey == 2) 
        {//2:加減乘除。

        }
        op = sender.currentTitle!
        opL.text = op
    }
    
    // number button click
    // connect to 1234567890
    @IBAction func numBclick(_ sender: UIButton) {
        if (prevKey == 0) { //0:等號。
            clearBclick(sender)
            outL.text = sender.currentTitle!
            prevKey = 1
        }
        else if (prevKey == 1) {//1:數字。
            outL.text?.append(sender.currentTitle!)
            prevKey = 1
        }
        else if (prevKey == 2) {//2:加減乘除。
            outL.text = sender.currentTitle!
            prevKey = 1
        }        
    }
    
    // dot button click
    // connect to .
    @IBAction func dotBclick(_ sender: UIButton) {
        if outL.text?.contains(".") == false
        {
            outL.text?.append(sender.currentTitle!)
        }
        prevKey = 1
    }
    
    @IBAction func equBclick(_ sender: UIButton) {
        if (prevKey == 0 || prevKey == 1)
        {//1:數字。
            if(num1 == nil && num2 == nil)
            {
                num1 = Double(outL.text!)!
                ans = num1!
                //num2 = nil
                outL.text = String(ans)
            }
            else if(num1 != nil && num2 == nil)
            {
                num2 = Double(outL.text!)!
                switch op 
                {
                case "+":
                    ans = num1! + num2!
                case "-":
                    ans = num1! - num2!
                case "×":
                    ans = num1! * num2!
                case "÷":
                    ans = num1! / num2!
                default:
                    break
                }
                outL.text = String(ans)
            }
            else if(num1 != nil && num2 != nil)
            {
                num1 = ans
                num2 = Double(outL.text!)!
                switch op {
                case "+":
                    ans = num1! + num2!
                case "-":
                    ans = num1! - num2!
                case "×":
                    ans = num1! * num2!
                case "÷":
                    ans = num1! / num2!
                default:
                    break
                }
                outL.text = String(ans)
            }

            prevKey = 0
        }
        else if (prevKey == 2) 
        {//2:加減乘除。
            //無效輸入 直接清除
            clearBclick(sender)
        }
        opL.text = ""
        op = ""
    }
    
    @IBAction func rootBclick(_ sender: Any) {
        var ans = Double(outL.text!)!
        ans = pow(ans, 0.5)
        outL.text = String(ans)
    }
    
    @IBAction func signBclick(_ sender: UIButton) {
        if(outL.text!.hasPrefix("-"))
        {
            let str = outL.text!
            let index = str.index(str.startIndex, offsetBy: 1)
            outL.text = String(str[index...])
        }
        else
        {
            outL.text = "-" + outL.text!
        }
        ans = Double(outL.text!)!
    }
    
    @IBAction func PercentageBclick(_ sender: UIButton) {

    }
    
    @IBAction func clearBclick(_ sender: UIButton) {
        ans = 0.0
        num1 = nil
        num2 = nil
        outL.text = "0"
        op = ""
        opL.text = ""
        prevKey = 0
    }
    
    @IBAction func delBclick(_ sender: UIButton) {
        if(outL.text!.count == 1)
        {
            outL.text = "0"
        }
        else
        {
            let str = outL.text!
            let index = str.index(str.endIndex, offsetBy: -1)
            outL.text = String(str[..<index])
        }
    }
}

