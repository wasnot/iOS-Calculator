//
//  ViewController.swift
//  Calculator
//
//  Created by AidaAkihiro on 2015/06/23.
//  Copyright (c) 2015年 Wasnot Apps. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    // ÷
    let DIVIDE = "\u{00F7}"
    // ×
    let MULTIPLY = "\u{00D7}"
    // -
    let SUBSTRUCT = "\u{002D}"
    // +
    let ADD = "\u{002B}"

    @IBOutlet weak var currentValue: UILabel!
    @IBOutlet weak var newValue: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushNumber(sender: AnyObject) {
        var button = sender as! UIButton
        let str = button.currentTitle
        let cha :Character? = str?[str!.startIndex]
        
        // 小数点だけ処理を注意
        if(cha != "."){
            newValue.text?.append(cha!)
        }else if(count(newValue.text!)==0){
            newValue.text?.append(Character("0"))
            newValue.text?.append(cha!)
        }else if(newValue.text?.rangeOfString(".") == nil){
            newValue.text?.append(cha!)
        }
        
        if(count(actionLabel.text!)==0){
            currentValue.text = ""
        }
    }
    
    @IBAction func pushAction(sender: AnyObject) {
        var button = sender as! UIButton
        println("button :\(button.tag)")
        
        let next = calc()
        
        currentValue.text = next
        newValue.text = ""
        
        switch button.tag {
        case 4: // ÷
            actionLabel.text = DIVIDE
            println("action :\(actionLabel.text)")
        case 5: // ×
            actionLabel.text = MULTIPLY
            println("action :\(actionLabel.text)")
        case 6: // -
            actionLabel.text = SUBSTRUCT
            println("action :\(actionLabel.text)")
        case 7: // +
            actionLabel.text = ADD
            println("action :\(actionLabel.text)")
        case 8: // =
            actionLabel.text = ""
            println("action :\(actionLabel.text)")
            println("test \(StringNumberHandler.test())")
            println("test2 \(StringNumberHandler.test2())")
            println("test3 \(StringNumberHandler.test3())")
            break
        default:
            break
        }
    }
    
    @IBAction func pushEdit(sender: AnyObject) {
        var button = sender as! UIButton
        println("button :\(button.tag), \(count(newValue.text!))")
        let str = newValue.text!
        switch button.tag {
        case 1: // +/-            // 一文字以上あるときのみ処理する
            if(count(str)==0){
                break
            }
            if(str.hasPrefix("-")){
                newValue.text = str.substringFromIndex(str.startIndex.successor())
            }else{
                newValue.text = "-" + str
            }
        case 2: // clear
            newValue.text = String()
            currentValue.text = String()
        case 3: // delete
            let c = count(str)
            if(c > 0){
                var str2 = str.substringToIndex(str.endIndex.predecessor())
                // -だけになったら全て削除
                if(str2=="-"){
                    str2 = ""
                }
                newValue.text = str2
            }
        default:
            break
        }
    }
    
    func calc() -> String? {
        println("calc \(newValue.text),\(actionLabel.text),\(currentValue.text)")
        if(count(newValue.text!)==0){
            // 新しい値がなければそのまま
            return currentValue.text
        }
        if(count(currentValue.text!)==0 || count(actionLabel.text!)==0){
            println("calc no action..")
            // 計算方法が入ってなかったり対象がなければ
            return newValue.text
        }
        let new  = (newValue.text as NSString?)!.doubleValue
        let curr = (currentValue.text as NSString?)!.doubleValue
        let next : Double?
        
        switch actionLabel.text! {
        case DIVIDE: // ÷
            if(new != 0){
                next = curr / new
            }else{
                next = nil
            }
            break
        case MULTIPLY: // ×
            next = curr * new
            break
        case SUBSTRUCT: // -
            next = curr - new
            break
        case ADD: // +
            next = curr + new
            break
        default:
            next = nil
            break
        }
        return (next != nil) ? next?.description : ""
    }
}

