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
    var num1 = 0.0
    var num2 = 0.0
    var dot : Bool = false //是否已經輸入過小數點
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        outL.text = "0"
        opL.text = ""
    }
    
    // operotor button click
    // connect to + - * /
    @IBAction func opBclick(_ sender: UIButton) {
        op = sender.currentTitle!
        opL.text = op
    //try
        num1 = Double(outL.text!)!
        outL.text = "0"
        dot = false
    }
    
    // number button click
    // connect to 1234567890
    @IBAction func numBclick(_ sender: UIButton) {
        if(outL.text == "0")
        {
            outL.text = ""
        }
        outL.text?.append(sender.currentTitle!)
    }
    
    // dot button click
    // connect to .
    @IBAction func dotBclick(_ sender: UIButton) {
        if dot == false {
            dot = true
            outL.text?.append(sender.currentTitle!)
        }
    }
    
    @IBAction func equBclick(_ sender: UIButton) {
        
    //try
        num2 = Double(outL.text!)!
       
        switch op {
        case "+":
            ans = num1 + num2
        case "-":
            ans = num1 - num2
        case "×":
            ans = num1 * num2
        case "÷":
            ans = num1 / num2
        default:
            break
        }
        
        opL.text = ""
        op = ""
        dot = false
        outL.text = String(ans)
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
    }
    
    @IBAction func PercentageBclick(_ sender: UIButton) {

    }
    
    @IBAction func clearBclick(_ sender: UIButton) {
        ans = 0.0
        op = ""
        num1 = 0.0
        num2 = 0.0
        dot = false
        outL.text = "0"
        opL.text = ""
    }
    
    @IBAction func delBclick(_ sender: UIButton) {
        if(outL.text!.count==1)
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

