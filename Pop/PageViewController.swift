//
//  PageViewController.swift
//  Pop
//
//  Created by Victor Odouard on 12/20/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIGestureRecognizerDelegate {
    
    var orderedViewControllers: [UIViewController]!
    var lastViewController: UIViewController!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        dataSource = self
        orderedViewControllers = [SettingsViewController(pageViewController: self), ThoughtViewController(pageViewController: self), PopViewController(pageViewController: self)]

        lastViewController = orderedViewControllers[2]
        let firstViewController = orderedViewControllers[1]
        let viewControllers = [firstViewController]
        setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
        
        if let _ = view.gestureRecognizers {
            for gr in self.view.gestureRecognizers! {
                gr.delegate = self
            }
        }
        
    }
    
    
    // PageViewController Datasource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentVCIndex = orderedViewControllers.index(of: viewController)
        let nextVCIndex = currentVCIndex! < orderedViewControllers.count - 1 ? currentVCIndex! + 1 : 0
        lastViewController = viewController
        
        return orderedViewControllers[nextVCIndex]
        
        /*if let _ = viewController as? ThoughtViewController {
            return PopViewController(lastBackground: ThoughtViewController().background)
        }
        else if let _ = viewController as? SettingsViewController  {
            return ThoughtViewController(lastBackground: SettingsViewController().background)
        }
        else {
            return nil
        }*/
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentVCIndex = orderedViewControllers.index(of: viewController)
        let nextVCIndex = currentVCIndex! > 0 ? currentVCIndex! - 1 : orderedViewControllers.count - 1
        lastViewController = viewController
        
        return orderedViewControllers[nextVCIndex]
        
        /*
        if let _ = viewController as? PopViewController {
            print("in here")
            return ThoughtViewController(lastBackground: PopViewController().background)
        }
        else if let _ = viewController as? ThoughtViewController  {
            return SettingsViewController()
        }
        else {
            return nil
        }*/
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if let _ = gestureRecognizer as? UITapGestureRecognizer {
            let touchPoint = touch .location(in: self.view)
            if (touchPoint.y > 40 ){
                return false
            } else{
                return true
            }
        }
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
