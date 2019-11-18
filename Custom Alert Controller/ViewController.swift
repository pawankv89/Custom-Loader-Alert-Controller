//
//  ViewController.swift
//  Custom Alert Controller
//
//  Created by Pawan kumar on 14/11/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
       @IBAction func showLoader(_ sender: UIButton) {
        
            UICustomAlertController.shared.displayActivityIndicatorAlert(message: "Loading")
            //UICustomAlertController.shared.displayActivityIndicatorAlert(message: "")
            //UICustomAlertController.shared.displayActivityIndicatorAlert(message: nil)
       }

}

/* OUTPUT ERROR
 
 2019-11-14 12:26:25.444209+0530 Custom Alert Controller[43880:544522] A constraint factory method was passed a nil layout anchor.  This is not allowed, and may cause confusing exceptions. Break on BOOL _NSLayoutConstraintToNilAnchor(void) to debug.  This will be logged only once.  This may break in the future.
 2019-11-14 12:26:30.316559+0530 Custom Alert Controller[43880:544522] Can't end BackgroundTask: no background task exists with identifier 2 (0x2), or it may have already been ended. Break in UIApplicationEndBackgroundTaskError() to debug.

 
 */
