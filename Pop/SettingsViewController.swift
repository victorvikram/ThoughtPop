//
//  SettingsViewController.swift
//  Pop
//
//  Created by Victor Odouard on 12/23/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit

class SettingsViewController: UniversalViewController {

    let background = UIColor(displayP3Red: 59/255, green: 0/255, blue: 156/255, alpha: 1.0)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = background
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func getBackground() -> UIColor {
        return background
    }
    
    // Getters
    override func getHeaderImage() -> UIImage {
        return #imageLiteral(resourceName: "settings").withRenderingMode(.alwaysTemplate)
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
