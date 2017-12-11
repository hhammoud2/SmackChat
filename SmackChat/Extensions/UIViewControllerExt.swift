//
//  UIViewControllerExt.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/11/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
        
        guard let presentedViewController = presentedViewController else { return }
        presentedViewController.dismiss(animated: false, completion: {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        })
    }
}
