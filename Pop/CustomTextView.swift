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
    let paddingInset = CGFloat(4)

   
    init(frame f: CGRect, margin m: CGFloat, color c: UIColor, delegate d: UITextViewDelegate, textContainer: NSTextContainer?) {
        margin = m
        color = c
       
        super.init(frame: f, textContainer: textContainer)
        
        // sets the textview delegate to itself, allowing it to increase in size as more text is added
        delegate = d
        
        // changes frame to be aligned with paddingInset
        frame = CGRect(x: f.minX - paddingInset, y: f.minY, width: f.width, height: f.height)
        
        // change font size, font color, and background color
        backgroundColor = .clear
        font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightLight)
        textColor = color
        
        // adds bottom border
        textContainer?.lineFragmentPadding = 0
        let width = CGFloat(2.0)
        border.borderColor = color.withAlphaComponent(0.5).cgColor
        border.frame = CGRect(x: paddingInset, y: frame.size.height - width, width:  frame.size.width, height: 2)
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
        
    }
    
    func changeSize(newSize: CGSize) {
        
    
        // adjust border after
        let width = CGFloat(2.0)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations:
            {  self.border.frame = CGRect(x: self.paddingInset, y: self.frame.size.height - width, width:  self.frame.size.width, height: 2) }, completion: {(value: Bool) in self.frame.size.height = newSize.height})
        
        print("New frame: ", frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented for CustomTextView")
    }
    
        
}
