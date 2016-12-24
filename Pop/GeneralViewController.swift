//
//  GeneralViewController.swift
//  Pop
//
//  Created by Victor Odouard on 12/20/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit

class GeneralViewController: UniversalViewController, AKPickerViewDelegate, AKPickerViewDataSource {
    
    
        
    // Emoji array
    var emojiArray = [#imageLiteral(resourceName: "angry"), #imageLiteral(resourceName: "any"), #imageLiteral(resourceName: "bored"), #imageLiteral(resourceName: "confused"), #imageLiteral(resourceName: "crying"), #imageLiteral(resourceName: "embarrassed"), #imageLiteral(resourceName: "happy"), #imageLiteral(resourceName: "in-love"), #imageLiteral(resourceName: "nervous"), #imageLiteral(resourceName: "neutral"), #imageLiteral(resourceName: "sad"), #imageLiteral(resourceName: "sleepy"), #imageLiteral(resourceName: "surprised")]
    let emojiNameArray = ["Angry", "Any", "Bored", "Confused", "Crying", "Embarrassed", "Happy", "In Love", "Nervous", "Neutral", "Sad", "Sleepy", "Surprised" ]
    
    // UI Elements
    
    let lowerUIView = UIView()
    var emojiPickerView: AKPickerView!
    let mainButton = ZFRippleButton()
    let emojiUILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Emoji PickerView
        addEmojiPickerView()
        
        // Check Button
        let mainButtonImage = getMainButtonImage()
        addButton(button: mainButton, image: mainButtonImage, x: 1/2, y: 5.5, wFactor: 2.1875, hFactor: 1.25, mainButton: true)
        
        // emojiUILabel Setup
        addLabel(label: emojiUILabel, alignment: .center, frame: nil, center: CGPoint(x: view.frame.width / 2, y: emojiPickerView.center.y + 0.85 * margin), superFrame: lowerUIView)
        
        
    }
    
    // Layout functions
    
    /* adds labels */
    func addLabel(label: UILabel, alignment: NSTextAlignment, frame: CGRect?, center: CGPoint?, superFrame: UIView?) {
        label.backgroundColor = .clear
        if let f = frame { label.frame = f }
        else { label.frame = CGRect(x: 0, y: 0, width: 100, height: fontSize + 5) }
        label.textColor = UIElementColor
        label.textAlignment = alignment
        label.font = label.font.withSize(fontSize)
        if let c = center { label.center = c }
        if let sf = superFrame { sf.addSubview(label) }
        else { view.addSubview(label) }
        print("here")
    }
    
    /* adds the emojiPickerView */
    func addEmojiPickerView() {
        let pickerFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: 2 * margin)
        emojiPickerView = AKPickerView(frame: pickerFrame)
        emojiPickerView.delegate = self
        emojiPickerView.dataSource = self
        emojiPickerView.backgroundColor = .clear
        emojiPickerView.interitemSpacing = 1/4 * margin
        emojiPickerView.viewDepth = 50 * margin
        emojiPickerView.selectItem(7)
        emojiPickerView.pickerViewStyle = .flat
        if let _ = self as? PopViewController {
            emojiPickerView.center = CGPoint(x: view.frame.width / 2, y: 3.5 * margin)
        }
        else {
            emojiPickerView.center = CGPoint(x: view.frame.width / 2, y: 3.1 * margin)
        }
        lowerUIView.addSubview(emojiPickerView)
    }
    
    /* performs necessary actions to add the three buttons in a row */
    func addButton(button: ZFRippleButton, image: UIImage, x: CGFloat, y: CGFloat, wFactor: CGFloat = 1, hFactor: CGFloat = 1, mainButton: Bool = false) {
        button.setImage(image, for: .normal)
        button.tintColor = UIElementColor
        button.frame = CGRect(x: 0, y: 0, width: margin * wFactor, height: margin * hFactor)
        if(mainButton) {
            button.layer.cornerRadius = 10
        }
        else {
            button.layer.cornerRadius = margin * wFactor / 2
            button.imageEdgeInsets = UIEdgeInsets(top: margin * 0.25, left: margin * 0.25, bottom: margin * 0.25, right: margin * 0.25)
        }
        button.center = CGPoint(x: view.frame.width * x, y: margin * y)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.rippleColor = UIElementColor.withAlphaComponent(0.0)
        button.rippleBackgroundColor = UIElementColor.withAlphaComponent(0.1)
        button.rippleOverBounds = false
        button.trackTouchLocation = true
        button.shadowRippleEnable = false
        lowerUIView.addSubview(button)
    }
    
    // Getters
    func getMainButtonImage() -> UIImage {
        return UIImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // AKPickerViewDataSource Functions
    
    /* specifies the number of items in the AKPickerView */
    func numberOfItemsInPickerView(_ pickerView: AKPickerView) -> Int {
        return emojiArray.count
    }
    
    /* specifies the image located for each item */
    func pickerView(_ pickerView: AKPickerView, imageForItem item: Int) -> UIImage {
        return emojiArray[item]
    }
    
    // AKPickerViewDelegate Functions
    func pickerView(_ pickerView: AKPickerView, didSelectItem item: Int) {
        if(item < emojiNameArray.count) {
            emojiUILabel.text = emojiNameArray[item]
        }
    }
    
    
    func buttonPressed() {
        print("hello")
    }

}
