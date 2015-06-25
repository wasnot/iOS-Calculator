//
//  ViewController.swift
//  Calculator
//
//  Created by AidaAkihiro on 2015/06/23.
//  Copyright (c) 2015年 Wasnot Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        newValue.text?.append(cha!)
    }
    @IBAction func pushAction(sender: AnyObject) {
    }
    @IBAction func pushEdit(sender: AnyObject) {
    }
}

