//
//  CustomSegue.swift
//  Juan Chomali
//
//  Created by Juan Chomali on 4/19/15.
//  Copyright (c) 2015 Juan Chomali. All rights reserved.
//

import UIKit
import QuartzCore


// MARK: Segue class
class CustomSegue: UIStoryboardSegue {
    
    
    override func perform() {
        let toViewController: UIViewController = self.destinationViewController as! UIViewController
        let fromViewController: UIViewController = self.sourceViewController as! UIViewController
        
        toViewController.view.layer.anchorPoint = CGPointZero
        fromViewController.view.layer.anchorPoint = CGPointZero
        
        toViewController.view.layer.position = CGPointZero
        fromViewController.view.layer.position = CGPointZero
        
        let containerView: UIView? = fromViewController.view.superview
        toViewController.view.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        containerView?.addSubview(toViewController.view)
        
       
       
        UIView.animateWithDuration(0.8, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1.3, options: nil, animations: {
            fromViewController.view.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            toViewController.view.transform = CGAffineTransformIdentity
            }, completion: {finished in
                let fromVC: UIViewController = self.sourceViewController as! UIViewController
                let toVC: UIViewController = self.destinationViewController as! UIViewController
                fromVC.presentViewController(toVC, animated: false, completion: nil)
        })

    }
    
}
