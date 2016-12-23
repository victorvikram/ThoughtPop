//
//  UniversalViewController.swift
//  Pop
//
//  Created by Victor Odouard on 12/23/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit

class UniversalViewController: UIViewController {

    var pageViewController: PageViewController
    
    // initializer for having access to the pageviewcontroller
    init(pageViewController pc: PageViewController) {
        pageViewController = pc
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = pageViewController.lastViewController.view.backgroundColor
        pageViewController.lastViewController = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
         UIView.animate(withDuration: 0.5, animations: { self.view.backgroundColor = self.getBackground() })
    }
    
    /* gets the background color */
    func getBackground() -> UIColor {
        return UIColor()
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
