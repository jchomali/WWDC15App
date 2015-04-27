//
//  WelcomeVC.swift
//  Juan Chomali
//
//  Created by Juan Chomali on 4/17/15.
//  Copyright (c) 2015 Juan Chomali. All rights reserved.
//

import UIKit
import CoreGraphics
import AVFoundation

class WelcomeVC: UIViewController {

    @IBOutlet var bgImage: UIImageView!
    @IBOutlet var blurredBgImage: UIImageView!
    @IBOutlet var contentView: UIView!
    
    var buttonSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cardSound", ofType: "caf")!)
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        
        
        configureView()
        
        audioPlayer = AVAudioPlayer(contentsOfURL: buttonSound, error: nil)
        audioPlayer.prepareToPlay()
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(animated: Bool) {

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView(){
        
        
        blurredBgImage.image=UIImage(named: "mainPhotoBGBlurred")
        blurredBgImage.alpha=0
        blurredBgImage.backgroundColor=UIColor.clearColor()

        view.bringSubviewToFront(contentView)
        
        UIView.animateWithDuration(0.5, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.blurredBgImage.alpha=1
            }) { (Bool) -> Void in
                self.showData()
        }
    }
    
    func showData(){
        
        var heightAndWidthForImage = (self.view.frame.width-20)/2
        var imageContainer : UIView! = UIView(frame: CGRect(x: (view.frame.width-heightAndWidthForImage)/2, y: 30, width: heightAndWidthForImage, height: heightAndWidthForImage))
        imageContainer.layer.masksToBounds=true
        imageContainer.layer.borderWidth=5
        imageContainer.layer.borderColor=UIColor(red:226.0/255.0, green:230.0/255.0, blue:231.0/255.0, alpha:1.0).CGColor
        imageContainer.layer.cornerRadius=imageContainer.frame.width/2
        imageContainer.alpha=0
        
        var profileImageView=UIImageView(image: UIImage(named: "profilePic"))
        profileImageView.frame=CGRect(x: -10, y: -10, width: heightAndWidthForImage+20, height: heightAndWidthForImage+20)
        profileImageView.layer.masksToBounds=true
        profileImageView.layer.cornerRadius=imageContainer.frame.width/2
        imageContainer.addSubview(profileImageView)
        contentView.addSubview(imageContainer)
        
        var textExplanationTopMargin = heightAndWidthForImage
        if self.view.frame.height==480{
            textExplanationTopMargin = heightAndWidthForImage+30
        }
        var textExplanation=UILabel(frame: CGRectMake(20, textExplanationTopMargin, self.view.frame.width-40, self.view.frame.height-(imageContainer.frame.height+imageContainer.frame.origin.y+30)-50))
        textExplanation.numberOfLines=0
        textExplanation.textColor=UIColor.whiteColor()
        var fontSizeForText = 22*self.view.frame.width/320
        textExplanation.font=UIFont(name: "AvenirNext-Medium", size: fontSizeForText)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 20
        paragraphStyle.alignment=NSTextAlignment.Center
        
        var attrString = NSMutableAttributedString(string: "Hello\nI am Juan Chomali\nI am an Entrepreneur\n16 years old")
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        textExplanation.attributedText=attrString
        textExplanation.alpha=0
        view.addSubview(textExplanation)
        
        var btn = UIButton(frame: CGRectMake(0, self.view.frame.height-70, self.view.frame.width, 40))
        btn.setTitle("Start!", forState: UIControlState.Normal)
        btn.addTarget(self, action: "finishWelcome:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var fontSizeForBtnTitle = 24*self.view.frame.width/320
        btn.titleLabel!.font=UIFont(name: "AvenirNext-Medium", size: fontSizeForBtnTitle)
        btn.titleLabel!.textAlignment=NSTextAlignment.Center
        btn.alpha=0
        view.addSubview(btn)
        
        imageContainer.transform=CGAffineTransformMakeScale(2.0, 2.0)
        textExplanation.transform=CGAffineTransformMakeScale(2.0, 2.0)
        btn.transform=CGAffineTransformMakeScale(2.0, 2.0)
        
        
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
            imageContainer.alpha=1
            imageContainer.transform=CGAffineTransformMakeScale(1.0, 1.0)
            }) { (Bool) -> Void in
                
        }
        UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
            textExplanation.alpha=1
            textExplanation.transform=CGAffineTransformMakeScale(1.0, 1.0)
            }) { (Bool) -> Void in
                
        }
        UIView.animateWithDuration(0.4, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
            btn.alpha=1
            btn.transform=CGAffineTransformMakeScale(1.0, 1.0)
            }) { (Bool) -> Void in
                
        }
    
        //Add Parallax to all subviews
        // Set vertical effect
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
            type: .TiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -12
        verticalMotionEffect.maximumRelativeValue = 12
        
        // Set horizontal effect
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
            type: .TiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -12
        horizontalMotionEffect.maximumRelativeValue = 12
        
        // Create group to combine both
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        // Add both effects to your view
        profileImageView.addMotionEffect(group)
        btn.addMotionEffect(group)
        textExplanation.addMotionEffect(group)
        
    }
    
    @IBAction func finishWelcome(sender: AnyObject) {
        audioPlayer.play()
        performSegueWithIdentifier("finishWelcome", sender: self)
    }

    

}
