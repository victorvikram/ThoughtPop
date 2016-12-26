//
//  ViewController.swift
//  Pop
//
//  Created by Victor Odouard on 12/16/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit
//import AKPickerView_Swift


class ThoughtViewController: GeneralViewController, UITextViewDelegate {
    
    // Color
    let background = UIColor(displayP3Red: 75/255, green: 0, blue: 200/255, alpha: 1.0)
    var lastBackground = UIColor(displayP3Red: 47/255, green: 0, blue: 122/255, alpha: 1.0)
    
    // UI Elements
    var titleTextField: CustomTextField!
    let titleTextFieldLabel = UILabel()
    let photoButton = ZFRippleButton()
    var bodyTextView: CustomTextView!
    let bodyTextViewLabel = UILabel()
    let locationButton = ZFRippleButton()
    let timeButton = ZFRippleButton()
    var frequencyButton = ZFRippleButton()
    
    var maxBodySize: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = background
        
        // Title Text Field
        addTitleTextField()
        
        // Title Text Field Label
        titleTextFieldLabel.text = "Title"
        addLabel(label: titleTextFieldLabel, alignment: .left, frame: CGRect(x: titleTextField.frame.minX, y: titleTextField.frame.maxY, width: 100, height: fontSize + 7), center: nil, superFrame: nil)
        
        // Photo button
        let photoButtonImage = #imageLiteral(resourceName: "photo").withRenderingMode(.alwaysTemplate)
        addButton(button: photoButton, image: photoButtonImage, x: 0.855, y: 4.4, wFactor: 1.5, hFactor: 1.2, superView: view)
        
        // Body Textview 
        addBodyTextView()
        
        // Body Text View Label
        bodyTextViewLabel.text = "Body"
        addLabel(label: bodyTextViewLabel, alignment: .left, frame: CGRect(x: margin, y: 0, width: 100, height: fontSize + 7), center: nil, superFrame: lowerUIView)

        // Lower UIView is the location of all the components underneath the body text view
        lowerUIView.backgroundColor = .clear
        lowerUIView.frame = CGRect(x: 0, y: 6 * margin, width: view.frame.width, height: view.frame.height)
        view.addSubview(lowerUIView)
        
        // Location Button
        let locationImage = #imageLiteral(resourceName: "location").withRenderingMode(.alwaysTemplate)
        addButton(button: locationButton, image: locationImage, x: 1/4, y: 1.25, wFactor: 1.5, hFactor: 1.5, superView: lowerUIView)
        
        
        // Time Button
        let timeImage = #imageLiteral(resourceName: "time").withRenderingMode(.alwaysTemplate)
        addButton(button: timeButton, image: timeImage, x: 1/2, y: 1.25, wFactor: 1.5, hFactor: 1.5, superView: lowerUIView)
        
        // Frequency Button
        let frequencyImage = #imageLiteral(resourceName: "frequency").withRenderingMode(.alwaysTemplate)
        addButton(button: frequencyButton, image: frequencyImage, x: 3/4, y: 1.25, wFactor: 1.5, hFactor: 1.5, superView: lowerUIView)
        
        // calculate maxBodySize
        let headerRoom = titleTextField.frame.minY
        let titleRoom = titleTextField.frame.height
        let buttonRoom = frequencyButton.frame.height + margin
        let pickerViewRoom = emojiPickerView.frame.height + margin
        let mainButtonRoom = mainButton.frame.height + margin / 2
        maxBodySize = view.frame.height - headerRoom - titleRoom - buttonRoom - pickerViewRoom - mainButtonRoom
    }
    
    // Layout Functions
    
    /* adds title text field and associated elements */
    func addTitleTextField() {
        let titleFrame = CGRect(x: margin, y: 4 * margin, width: view.frame.width - 4 * margin, height: 0.75 * margin)
        titleTextField = CustomTextField(color: UIElementColor, frame: titleFrame)
        view.addSubview(titleTextField)
    }
    
    /* adds body text view */
    func addBodyTextView() {
        let bodyFrame = CGRect(x: margin, y: 5 * margin, width: view.frame.width - 2 * margin, height: margin)
        bodyTextView = CustomTextView(frame: bodyFrame, margin: margin, color: UIElementColor, delegate: self, textContainer: nil)
        bodyTextView.isScrollEnabled = true
        view.addSubview(bodyTextView)
    }
    
    // Getters
    
    /* gets main button image */
    override func getMainButtonImage() -> UIImage {
        return #imageLiteral(resourceName: "check-button")
    }
    
    /* gets header image */
    override func getHeaderImage() -> UIImage {
        return #imageLiteral(resourceName: "new").withRenderingMode(.alwaysTemplate)
    }
    
    /* gets the background color */
    override func getBackground() -> UIColor {
        return background
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TextView delegate functions
    func textViewDidChange(_ textView: UITextView) {
        // calculate the necessary size
        let oldHeight = bodyTextView.frame.height

        var newSize = bodyTextView.sizeThatFits(CGSize(width: bodyTextView.frame.size.width, height: margin * 4))
        
        print("Old Size: ", oldHeight)
        print("Old Frame: ", bodyTextView.frame)
        print("New Size: ", newSize.height)
        
        // if(oldHeight == newSize.height) { return }
        
        
        
        // if frame is increasing in size, first adjust frame
        /* bodyTextView.frame = CGRect(x: bodyTextView.frame.minX, y: bodyTextView.frame.minY, width: bodyTextView.frame.width, height: newSize.height) */
        // Lower the lowerUIView
        
        if (newSize.height > maxBodySize) { newSize.height = maxBodySize }
        
        let difference = newSize.height - oldHeight
        let oldY = lowerUIView.frame.minY
        UIView.animate(withDuration: 0.5, animations: {
            self.lowerUIView.frame = CGRect(x: 0, y: oldY + difference, width: self.view.frame.width, height: self.view.frame.height)})

        // change size of the textview
        bodyTextView.changeSize(newSize: newSize)
    }

    
    

}

