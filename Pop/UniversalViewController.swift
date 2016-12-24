//
//  UniversalViewController.swift
//  Pop
//
//  Created by Victor Odouard on 12/23/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit

class UniversalViewController: UIViewController {
    
    var margin: CGFloat!
    var fontSize: CGFloat!

    var pageViewController: PageViewController
    var UIElementColor: UIColor
    
    let headerImageView = UIImageView()
    
    // initializer for having access to the pageviewcontroller
    init(pageViewController pc: PageViewController) {
        pageViewController = pc
        UIElementColor = pc.UIElementColor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        margin = pageViewController.margin
        fontSize = margin / 3
        
        // Do any additional setup after loading the view.
        
        // Header Image
        addHeader()
    }
    
    /* adds header given an image */
    func addHeader() {
        
        headerImageView.image = getHeaderImage()
        headerImageView.tintColor = UIElementColor
        headerImageView.backgroundColor = .clear
        headerImageView.frame = CGRect(x: 0, y: 0, width: 2 * margin, height: 2  * margin)
        headerImageView.center = CGPoint(x: view.frame.width / 2, y: 2 * margin)
        headerImageView.contentMode = .scaleAspectFit
        view.addSubview(headerImageView)
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
        UIView.animate(withDuration: 0.5, animations: { self.view.backgroundColor = self.getBackground()})
        let currentViewControllerId = pageViewController.orderedViewControllers.index(of: self)
        pageViewController.pageControl.currentPage = currentViewControllerId!
    }
    
    /* gets the background color */
    func getBackground() -> UIColor {
        return UIColor()
    }
    
    func getHeaderImage() -> UIImage {
        return UIImage()
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
