//
//  PageViewController.swift
//  Pop
//
//  Created by Victor Odouard on 12/20/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit
import SMPageControl

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    let UIElementColor = UIColor(displayP3Red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    
    let scaleMargin = CGFloat(0.05)
    let pageControl = SMPageControl(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    var margin: CGFloat!
    
    var orderedViewControllers: [UIViewController]!
    var lastViewController: UIViewController!
    
    var pageControlUIView = UIView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        
        margin = scaleMargin * view.frame.height

        super.viewDidLoad()
    
        dataSource = self
        orderedViewControllers = [SettingsViewController(pageViewController: self), ThoughtViewController(pageViewController: self), PopViewController(pageViewController: self)]

        lastViewController = orderedViewControllers[2]
        let firstViewController = orderedViewControllers[1]
        let viewControllers = [firstViewController]
        setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
        
        configurePageControl()
        
        pageControlUIView.frame = pageControl.frame
        
        // covers the page controller
        view.addSubview(pageControlUIView)
    }
    
    func configurePageControl() {
        pageControl.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - margin)
        pageControl.pageIndicatorTintColor = UIElementColor.withAlphaComponent(0.5)
        pageControl.numberOfPages = 3
        pageControl.currentPage = 1
        pageControl.currentPageIndicatorTintColor = UIElementColor
        pageControl.backgroundColor = .clear
        pageControl.setImage(#imageLiteral(resourceName: "settings-pagecontrol-transparent"), forPage: 0)
        pageControl.setCurrentImage(#imageLiteral(resourceName: "settings-pagecontrol"), forPage: 0)
        pageControl.setImage(#imageLiteral(resourceName: "new-page-control-transparent"), forPage: 1)
        pageControl.setCurrentImage(#imageLiteral(resourceName: "new-page-control"), forPage: 1)
        pageControl.setImage(#imageLiteral(resourceName: "view-page-control-transparent"), forPage: 2)
        pageControl.setCurrentImage(#imageLiteral(resourceName: "view-page-control"), forPage: 2)
        pageControl.tapBehavior = SMPageControlTapBehavior.jump
        pageControl.indicatorMargin = margin * 1.25
        view.addSubview(pageControl)
    }
    
    // PageViewController Datasource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentVCIndex = orderedViewControllers.index(of: viewController)
        let nextVCIndex = currentVCIndex! < orderedViewControllers.count - 1 ? currentVCIndex! + 1 : 0
        lastViewController = viewController
        
        return orderedViewControllers[nextVCIndex]

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentVCIndex = orderedViewControllers.index(of: viewController)
        let nextVCIndex = currentVCIndex! > 0 ? currentVCIndex! - 1 : orderedViewControllers.count - 1
        lastViewController = viewController
        
        return orderedViewControllers[nextVCIndex]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
