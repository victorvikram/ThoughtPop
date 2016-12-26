//
//  PopViewController.swift
//  Pop
//
//  Created by Victor Odouard on 12/20/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit

class PopViewController: GeneralViewController {
    
    // Color
    let background = UIColor(displayP3Red: 100/255, green: 5/255, blue: 255/255, alpha: 1.0)
    let lastBackground = UIColor(displayP3Red: 75/255, green: 0, blue: 200/255, alpha: 1.0)
    
    // textview for title and body
    let scrollView = UIScrollView()
    let titleLabel = UITextView()
    let bodyView = UITextView()
    
    var currentThought: Thought!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = background
        
        // Lower UIView is the location of all the components underneath the body text view
        lowerUIView.backgroundColor = .clear
        lowerUIView.frame = CGRect(x: 0, y: 0.75 * margin, width: view.frame.width, height: view.frame.height)
        view.addSubview(lowerUIView)
        
        currentThought = pageViewController.mind.nextThought()
        
        // Add ScrollView to the view
        let scrollViewY = mainButton.frame.maxY + margin / 2 + lowerUIView.frame.minY
        scrollView.frame = CGRect(x: 0, y: scrollViewY, width: view.frame.width, height: view.frame.height - scrollViewY - 2 * margin)
        
        // Add view for title
        titleLabel.text = currentThought.title
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = UIElementColor
        titleLabel.isEditable = false
        titleLabel.isScrollEnabled = false
        titleLabel.font = titleLabel.font?.withSize(headingSize)
        let titleViewSize = titleLabel.sizeThatFits(CGSize(width: view.frame.width - 2 * margin, height: 6 * margin))
        titleLabel.frame = CGRect(x: margin, y: 0, width: view.frame.width - 2 * margin, height: titleViewSize.height)
        scrollView.addSubview(titleLabel)
        
        // add view for body 
        bodyView.text = currentThought.body
        bodyView.backgroundColor = .clear
        bodyView.textColor = UIElementColor.withAlphaComponent(0.6)
        bodyView.isScrollEnabled = false
        bodyView.isEditable = false
        bodyView.font = bodyView.font?.withSize(bodySize)
        let bodyViewSize = bodyView.sizeThatFits(CGSize(width: view.frame.width - 2 * margin, height: 6 * margin))
        bodyView.frame = CGRect(x: margin, y: titleLabel.frame.maxY, width: view.frame.width - 2 * margin, height: bodyViewSize.height)
        scrollView.addSubview(bodyView)
        
        let heightOfContent = bodyViewSize.height + titleViewSize.height
        scrollView.contentSize = CGSize(width: view.frame.width, height: heightOfContent)
        
        scrollView.isScrollEnabled = true
        view.addSubview(scrollView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Getters
    override func getMainButtonImage() -> UIImage {
        return #imageLiteral(resourceName: "refresh-button")
    }
    
    override func getHeaderImage() -> UIImage {
        return #imageLiteral(resourceName: "view").withRenderingMode(.alwaysTemplate)
    }
    
    /* gets the background color */
    override func getBackground() -> UIColor {
        return background
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
