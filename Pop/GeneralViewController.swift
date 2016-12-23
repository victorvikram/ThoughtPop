//
//  GeneralViewController.swift
//  Pop
//
//  Created by Victor Odouard on 12/20/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit

class GeneralViewController: UniversalViewController, AKPickerViewDelegate, AKPickerViewDataSource {
    
    
    
    // Dimensions
    let scaleMargin = CGFloat(0.05)
    var margin: CGFloat!
    
    // Color
    let UIElementColor = UIColor(displayP3Red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    
    // Emoji array
    var emojiArray = [#imageLiteral(resourceName: "angry"), #imageLiteral(resourceName: "any"), #imageLiteral(resourceName: "bored"), #imageLiteral(resourceName: "confused"), #imageLiteral(resourceName: "crying"), #imageLiteral(resourceName: "embarrassed"), #imageLiteral(resourceName: "happy"), #imageLiteral(resourceName: "in-love"), #imageLiteral(resourceName: "nervous"), #imageLiteral(resourceName: "neutral"), #imageLiteral(resourceName: "sad"), #imageLiteral(resourceName: "sleepy"), #imageLiteral(resourceName: "surprised")]
    let emojiNameArray = ["Angry", "Any", "Bored", "Confused", "Crying", "Embarrassed", "Happy", "In Love", "Nervous", "Neutral", "Sad", "Sleepy", "Surprised" ]
    
    // UI Elements
    let headerImageView = UIImageView()
    let lowerUIView = UIView()
    var emojiPickerView: AKPickerView!
    let mainButton = ZFRippleButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        margin = scaleMargin * view.frame.height

        // Header Image
        addHeader()
        
        // Emoji PickerView
        addEmojiPickerView()
        
        // Check Button
        let mainButtonImage = getMainButtonImage()
        addButton(button: mainButton, image: mainButtonImage, x: 1/2, y: 5.5, wFactor: 2.1875, hFactor: 1.25, mainButton: true)

    }
    
    // Layout functions
    /* adds header given an image */
    func addHeader() {
        headerImageView.image = getHeaderImage()
        headerImageView.tintColor = UIElementColor
        headerImageView.backgroundColor = .clear
        headerImageView.frame = CGRect(x: 0, y: 0, width: 2 * margin, height: 2  * margin)
        headerImageView.center = CGPoint(x: view.frame.width / 2, y: 2 * margin)
        view.addSubview(headerImageView)
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
        emojiPickerView.center = CGPoint(x: view.frame.width / 2, y: 3 * margin)
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
        button.rippleColor = UIElementColor.withAlphaComponent(0.2)
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
    
    func getHeaderImage() -> UIImage {
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
    
    
    func buttonPressed() {
        print("hello")
    }

}
