//
//  ViewController.swift
//  Pop
//
//  Created by Victor Odouard on 12/16/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit
//import AKPickerView_Swift


class ViewController: UIViewController, AKPickerViewDelegate, AKPickerViewDataSource {
    
    // Dimensions
    let scaleMargin = CGFloat(0.05)
    var margin: CGFloat!
    
    // Colors
    let background = UIColor(displayP3Red: 75/255, green: 0, blue: 200/255, alpha: 1.0)
    let UIElementColor = UIColor(displayP3Red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    
    // UI Elements
    let headerImageView = UIImageView()
    var titleTextField: CustomTextField!
    var bodyTextView: CustomTextView!
    let lowerUIView = UIView()
    let locationButton = UIButton()
    let timeButton = UIButton()
    var frequencyButton = UIButton()
    var emojiPickerView: AKPickerView!
    let checkButton = UIButton()
    
    // Emoji array
    var emojiArray = [#imageLiteral(resourceName: "angry"), #imageLiteral(resourceName: "any"), #imageLiteral(resourceName: "bored"), #imageLiteral(resourceName: "confused"), #imageLiteral(resourceName: "crying"), #imageLiteral(resourceName: "embarrassed"), #imageLiteral(resourceName: "happy"), #imageLiteral(resourceName: "in-love"), #imageLiteral(resourceName: "nervous"), #imageLiteral(resourceName: "neutral"), #imageLiteral(resourceName: "sad"), #imageLiteral(resourceName: "sleepy"), #imageLiteral(resourceName: "surprised")]
    let emojiNameArray = ["Angry", "Any", "Bored", "Confused", "Crying", "Embarrassed", "Happy", "In Love", "Nervous", "Neutral", "Sad", "Sleepy", "Surprised" ]
    
    //Changing Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        margin = scaleMargin * view.frame.height
        view.backgroundColor = background
        
        // Header Image
        let headerImage = #imageLiteral(resourceName: "new").withRenderingMode(.alwaysTemplate)
        headerImageView.image = headerImage
        headerImageView.tintColor = UIElementColor
        headerImageView.backgroundColor = background
        headerImageView.frame = CGRect(x: 0, y: 0, width: 2 * margin, height: 2  * margin)
        headerImageView.center = CGPoint(x: view.frame.width / 2, y: 2 * margin)
        view.addSubview(headerImageView)
        
        // Title Text Field
        let titleFrame = CGRect(x: margin, y: 4 * margin, width: 7 * margin, height: 0.75 * margin)
        titleTextField = CustomTextField(color: UIElementColor, frame: titleFrame)
        view.addSubview(titleTextField)
        
        // Body Textview 
        let bodyFrame = CGRect(x: margin, y: 5 * margin, width: view.frame.width - 2 * margin, height: margin)
        bodyTextView = CustomTextView(frame: bodyFrame, margin: margin, color: UIElementColor, textContainer: nil)
        bodyTextView.sizeThatFits( CGSize(width: bodyTextView.frame.size.width, height: margin * 4))
        bodyTextView.isScrollEnabled = false
        view.addSubview(bodyTextView)
        
        // Lower UIView
        lowerUIView.backgroundColor = background
        lowerUIView.frame = CGRect(x: 0, y: 6.1 * margin, width: view.frame.width, height: view.frame.height)
        view.addSubview(lowerUIView)
        
        // Location Button
        let locationImage = #imageLiteral(resourceName: "location").withRenderingMode(.alwaysTemplate)
        addButton(button: locationButton, image: locationImage, x: 1/4, y: 1)
        
        
        // Time Button
        let timeImage = #imageLiteral(resourceName: "time").withRenderingMode(.alwaysTemplate)
        addButton(button: timeButton, image: timeImage, x: 1/2, y: 1)
        
        // Frequency Button
        let frequencyImage = #imageLiteral(resourceName: "frequency").withRenderingMode(.alwaysTemplate)
        addButton(button: frequencyButton, image: frequencyImage, x: 3/4, y: 1)
        
        // Emoji PickerView
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
        
        // Check Button
        let checkImage = #imageLiteral(resourceName: "check-button")
        addButton(button: checkButton, image: checkImage, x: 1/2, y: 5.5, wFactor: 2.1875, hFactor: 1.25)
    }
    
    // AKPickerViewDataSource Functions
    
    /* specifies the number of items in the AKPickerView */
    func numberOfItemsInPickerView(_ pickerView: AKPickerView) -> Int {
        return emojiArray.count
    }
    
    /* specifies the image located for each item */
    func pickerView(_ pickerView: AKPickerView, imageForItem item: Int) -> UIImage {
        //let colorChanged = emojiArray[item].maskWithColor(color: UIElementColor)!
        //let sizeChanged = colorChanged.resizeImage(targetSize: CGSize(width: 3/2 * margin, height: 3/2 * margin))
        return emojiArray[item]
    }
    
    /* performs necessary actions to add the three buttons in a row */
    func addButton(button: UIButton, image: UIImage, x: CGFloat, y: CGFloat, wFactor: CGFloat = 1, hFactor: CGFloat = 1) {
        button.setImage(image, for: .normal)
        button.tintColor = UIElementColor
        button.frame = CGRect(x: 0, y: 0, width: margin * wFactor, height: margin * hFactor)
        button.center = CGPoint(x: view.frame.width * x, y: margin * y)
        lowerUIView.addSubview(button)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

