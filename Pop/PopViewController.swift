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
    let background = UIColor(displayP3Red: 47/255, green: 0, blue: 122/255, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = background
        
        // Lower UIView is the location of all the components underneath the body text view
        lowerUIView.backgroundColor = .clear
        lowerUIView.frame = CGRect(x: 0, y: 2 * margin, width: view.frame.width, height: view.frame.height)
        view.addSubview(lowerUIView)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
