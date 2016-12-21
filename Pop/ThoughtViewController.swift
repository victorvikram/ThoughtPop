//
//  ViewController.swift
//  Pop
//
//  Created by Victor Odouard on 12/16/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit
//import AKPickerView_Swift


class ThoughtViewController: GeneralViewController {
    
    // Color
    let background = UIColor(displayP3Red: 75/255, green: 0, blue: 200/255, alpha: 1.0)
    
    // UI Elements
    var titleTextField: CustomTextField!
    var bodyTextView: CustomTextView!
    let locationButton = UIButton()
    let timeButton = UIButton()
    var frequencyButton = UIButton()
    
    
    //Changing Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = background
        
        // Title Text Field
        addTitleTextField()
        
        // Body Textview 
        addBodyTextView()
        
        // Lower UIView is the location of all the components underneath the body text view
        lowerUIView.backgroundColor = .clear
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
    }
    
    // Layout Functions
    
    /* adds title text field and associated elements */
    func addTitleTextField() {
        let titleFrame = CGRect(x: margin, y: 4 * margin, width: 7 * margin, height: 0.75 * margin)
        titleTextField = CustomTextField(color: UIElementColor, frame: titleFrame)
        view.addSubview(titleTextField)
    }
    
    /* adds body text view */
    func addBodyTextView() {
        let bodyFrame = CGRect(x: margin, y: 5 * margin, width: view.frame.width - 2 * margin, height: margin)
        bodyTextView = CustomTextView(frame: bodyFrame, margin: margin, color: UIElementColor, textContainer: nil)
        bodyTextView.sizeThatFits( CGSize(width: bodyTextView.frame.size.width, height: margin * 4))
        bodyTextView.isScrollEnabled = true
        view.addSubview(bodyTextView)
    }
    
    // Getters
    
    override func getMainButtonImage() -> UIImage {
        return #imageLiteral(resourceName: "check-button")
    }
    
    override func getHeaderImage() -> UIImage {
        return #imageLiteral(resourceName: "new").withRenderingMode(.alwaysTemplate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

