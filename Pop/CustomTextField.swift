//
//  CustomTextField.swift
//  Pop
//
//  Created by Victor Odouard on 12/17/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit

// Custom Text Field Class
class CustomTextField: UITextField {
    
    let border = CALayer()
    var borderColor = UIColor()
    
    /* the only initializer */
    init(color: UIColor, frame: CGRect) {
        super.init(frame: frame)
        
        // adds the bottom border
        let width = CGFloat(2.0)
        borderColor = color
        border.borderColor = borderColor.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - width, width:  frame.size.width, height: frame.size.height)
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
        
        // changes text color and size
        textColor = color.withAlphaComponent(1.0)
        font = UIFont(name: (font?.fontName)!, size: 24)
        
        // adds selection animations
        self.addTarget(self, action: #selector(fieldSelected), for: UIControlEvents.editingDidBegin)
        self.addTarget(self, action: #selector(fieldDeselected), for: UIControlEvents.editingDidEnd)
    }
    
    /* required initializer */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented for CustomTextField")
    }
    
    /* makes the border opaque when editing begins */
    func fieldSelected() {
        
        // ANIMATE
        UIView.animate(withDuration: 5,
                       delay: 0.0,
                       options: .curveEaseIn,
                       animations: { self.border.opacity = 1.0 } ,
                       completion: nil)
        
    }
    
    /* makes the border transparent again when editing ends */
    func fieldDeselected() {
        // ANIMATE

        UIView.animate(withDuration: 2,
                       delay: 0.0,
                       options: .curveEaseIn,
                       animations: { self.border.opacity = 0.5 } ,
                       completion: nil)
    }
}

