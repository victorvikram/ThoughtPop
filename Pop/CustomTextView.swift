//
//  CustomTextView.swift
//  Pop
//
//  Created by Victor Odouard on 12/17/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit

class CustomTextView: UITextView, UITextViewDelegate {
    var margin: CGFloat
    var color: UIColor
    let border = CALayer()

   
    init(frame: CGRect, margin m: CGFloat, color c: UIColor, textContainer: NSTextContainer?) {
        margin = m
        color = c
        super.init(frame: frame, textContainer: textContainer)
        
        // sets the textview delegate to itself, allowing it to increase in size as more text is added
        delegate = self
        
        // change font size, font color, and background color
        backgroundColor = .clear
        font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightLight)
        textColor = color
        
        // adds bottom border
        let width = CGFloat(2.0)
        border.borderColor = color.withAlphaComponent(0.5).cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - width, width:  frame.size.width, height: frame.size.height)
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented for CustomTextView")
    }
    
    func textViewDidChange(_ textView: UITextView) {
        // ANIMATE
        let newSize = sizeThatFits(CGSize(width: frame.size.width, height: margin * 4))
        frame.size.height = newSize.height
        let width = CGFloat(2.0)
        border.frame = CGRect(x: 0, y: frame.size.height - width, width:  frame.size.width, height: frame.size.height)
    }
    
}
