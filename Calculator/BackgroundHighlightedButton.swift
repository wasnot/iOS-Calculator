//
//  BackgroundHighlightedButton.swift
//  Calculator
//
//  Created by AidaAkihiro on 2015/06/26.
//  Copyright (c) 2015年 Wasnot Apps. All rights reserved.
//

import UIKit

class BackgroundHighlightedButton: UIButton {
    @IBInspectable var highlightedBackgroundColor :UIColor?
    @IBInspectable var nonHighlightedBackgroundColor :UIColor?
    override var highlighted :Bool {
        get {
            return super.highlighted
        }
        set {
            if newValue {
                self.backgroundColor = highlightedBackgroundColor
            }
            else {
                self.backgroundColor = nonHighlightedBackgroundColor
            }
            super.highlighted = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
