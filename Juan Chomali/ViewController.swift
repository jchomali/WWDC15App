//
//  ViewController.swift
//  Juan Chomali
//
//  Created by Juan Chomali on 4/14/15.
//  Copyright (c) 2015 Juan Chomali. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController, UIScrollViewDelegate, SwiftPromptsProtocol, UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {

    @IBOutlet var biographyCard: UIView!
    @IBOutlet var educationCard: UIView!
    @IBOutlet var interestsCard: UIView!
    @IBOutlet var projectsCard: UIView!
    @IBOutlet var socialCard: UIView!
    
    @IBOutlet var leftNavButton: UIButton!
    @IBOutlet var rightNavButton: UIButton!
    
    @IBOutlet var cousinView: UIView!
    @IBOutlet var cousinViewTitle: UILabel!
    @IBOutlet var cousinViewTitleTwin: UILabel!
    
    @IBOutlet var cousinWidth: NSLayoutConstraint!
    @IBOutlet var cousinHeight: NSLayoutConstraint!
    @IBOutlet var cousinYAlign: NSLayoutConstraint!
    @IBOutlet var cousinXAlign: NSLayoutConstraint!
    @IBOutlet var cousinLabelX: NSLayoutConstraint!
    @IBOutlet var scrollViewTopConst: NSLayoutConstraint!
    @IBOutlet var cousinLabelY: NSLayoutConstraint!
    @IBOutlet var cousinLabelWidth: NSLayoutConstraint!
    @IBOutlet var cousinLabelHeight: NSLayoutConstraint!

    @IBOutlet var cardsScrollView: UIScrollView!
    @IBOutlet var cardsContentView: UIView!
    @IBOutlet var educationContent: UIView!
    
    @IBOutlet var carrouselScrollView: UIScrollView!
    @IBOutlet var carrouselPageControl: UIPageControl!
    
    
    @IBOutlet var educationSchoolInfoTextView: UITextView!
    @IBOutlet var educationSchoolTitleLabel: UILabel!
    
    
    
    //Social Outlets
    
    @IBOutlet var socialContainer: UIView!
    
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var instagramButton: UIButton!
    @IBOutlet var skypeButton: UIButton!
    @IBOutlet var linkedinButton: UIButton!
    @IBOutlet var mailButton: UIButton!
    @IBOutlet var websiteButton: UIButton!
    @IBOutlet var socialButtonsHidder: UIView!
    
    
    @IBOutlet var twiiterXConstrait: NSLayoutConstraint!
    @IBOutlet var twiiterYConstrait: NSLayoutConstraint!
    @IBOutlet var instagramXConstrait: NSLayoutConstraint!
    @IBOutlet var instagramYConstrait: NSLayoutConstraint!
    @IBOutlet var websiteXConstrait: NSLayoutConstraint!
    @IBOutlet var websiteYConstrait: NSLayoutConstraint!
    @IBOutlet var facebookXConstrait: NSLayoutConstraint!
    @IBOutlet var facebookYConstrait: NSLayoutConstraint!
    @IBOutlet var skypeXConstrait: NSLayoutConstraint!
    @IBOutlet var skypeYConstrait: NSLayoutConstraint!
    @IBOutlet var linkedinXConstrait: NSLayoutConstraint!
    @IBOutlet var linkedinYConstrait: NSLayoutConstraint!
    @IBOutlet var mailXConstrait: NSLayoutConstraint!
    @IBOutlet var mailYConstrait: NSLayoutConstraint!
    @IBOutlet var socialButtonsHidderY: NSLayoutConstraint!
    
    
    @IBOutlet var interestsContainer: UIView!
    @IBOutlet var interestMusicImage: UIImageView!
    @IBOutlet var interestPhotographyImage: UIImageView!
    @IBOutlet var interestSoccerImage: UIImageView!
    @IBOutlet var interestTechImage: UIImageView!
    @IBOutlet var interestMusicText: UILabel!
    @IBOutlet var interestPhotographyText: UILabel!
    @IBOutlet var interestSoccerText: UILabel!
    @IBOutlet var interestTechText: UILabel!
    
    
    @IBOutlet var interestMusicHeight: NSLayoutConstraint!
    @IBOutlet var interestPhotographyHeight: NSLayoutConstraint!
    @IBOutlet var interestTechHeight: NSLayoutConstraint!
    
    @IBOutlet var interestsScrollView: UIScrollView!
    
    
    @IBOutlet var projectsTableView: UITableView!
    
    var projectsTitles: NSArray!
    var projectsDescriptions: NSArray!
    var projectsImages: NSArray!
    var projectsLinks: NSArray!
    
    var aboutMeContentScrollView: UIScrollView!
    var timeline: TimelineView!
    
    var openedViewTitlePosition: CGFloat!
    var textInSmallVersion=false
    var prompt = SwiftPromptsView()
    var swipesAlertShowed = false
    var viewLoaded = false
    var pinchToDismissAlertShowed = false
    var interestsTextsPadding :CGFloat! = 0
    
    // MARK: - Methods start here

    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.Slide)
        
        prepareAllViews()
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: false)
        
    }
    override func viewDidAppear(animated: Bool) {
        if (swipesAlertShowed==false){
            
            NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval((1)), target: self, selector: "showFirstPrompt", userInfo: nil, repeats: false)

            swipesAlertShowed = true
        }
        if viewLoaded==false{
            loadEachCardsSubviews()
            viewLoaded=true
        }
    }
    override func viewDidLayoutSubviews() {
       
        loadSocialCardSubview()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Cards
    
    func prepareAllViews() {
        //Init all views
        cardsContentView.clipsToBounds=false
        cardsScrollView.clipsToBounds=false
    
        biographyCard.layer.masksToBounds=false
        biographyCard.layer.cornerRadius=5.0
        biographyCard.layer.shadowColor = UIColor.blackColor().CGColor;
        biographyCard.layer.shadowRadius = 6.0;
        biographyCard.layer.shadowOpacity = 0.50;

        educationCard.layer.masksToBounds=false
        educationCard.layer.cornerRadius=5.0
        educationCard.layer.shadowColor = UIColor.blackColor().CGColor;
        educationCard.layer.shadowRadius = 6.0;
        educationCard.layer.shadowOpacity = 0.50;

        interestsCard.layer.masksToBounds=false
        interestsCard.layer.cornerRadius=5.0
        interestsCard.layer.shadowColor = UIColor.blackColor().CGColor;
        interestsCard.layer.shadowRadius = 6.0;
        interestsCard.layer.shadowOpacity = 0.50;

        projectsCard.layer.masksToBounds=false
        projectsCard.layer.cornerRadius=5.0
        projectsCard.layer.shadowColor = UIColor.blackColor().CGColor;
        projectsCard.layer.shadowRadius = 6.0;
        projectsCard.layer.shadowOpacity = 0.50;

        socialCard.layer.masksToBounds=false
        socialCard.layer.cornerRadius=5.0
        socialCard.layer.shadowColor = UIColor.blackColor().CGColor;
        socialCard.layer.shadowRadius = 6.0;
        socialCard.layer.shadowOpacity = 0.50;
        
    }
    
    func loadEachCardsSubviews(){
        
        if view.frame.width==320{
            interestsTextsPadding = 0
        }
        else{
            interestsTextsPadding = 20
        }
        
        //Cousin View
        cousinView.layer.masksToBounds=false
        cousinView.layer.cornerRadius=5.0
        cousinView.layer.shadowColor = UIColor.blackColor().CGColor;
        cousinView.layer.shadowRadius = 6.0;
        cousinView.layer.shadowOpacity = 0.50;
        
        cousinView.setTranslatesAutoresizingMaskIntoConstraints(false)
        cousinViewTitle.setTranslatesAutoresizingMaskIntoConstraints(false)
        cousinViewTitleTwin=cousinViewTitle
        
        
        
        
        //About Me Card
        
        aboutMeContentScrollView = UIScrollView(frame: view.bounds)
        aboutMeContentScrollView.hidden=true
        aboutMeContentScrollView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        cousinView.addSubview(aboutMeContentScrollView)
        cousinView.clipsToBounds=true
        cousinView.addConstraints([
            NSLayoutConstraint(item: aboutMeContentScrollView, attribute: .Left, relatedBy: .Equal, toItem: cousinView, attribute: .Left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: aboutMeContentScrollView, attribute: .Top, relatedBy: .Equal, toItem: cousinView, attribute: .Top, multiplier: 1.0, constant: 80),
            NSLayoutConstraint(item: aboutMeContentScrollView, attribute: .Right, relatedBy: .Equal, toItem: cousinView, attribute: .Right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: aboutMeContentScrollView, attribute: .Bottom, relatedBy: .Equal, toItem: cousinView, attribute: .Bottom, multiplier: 1.0, constant: 0)
            ])
        
        timeline = TimelineView(bulletType: .Circle, timeFrames: [
            TimeFrame(text: "I was born in Santiago, Chile.", date: "February 22, 1999", image: nil),
            TimeFrame(text: "Started going to school", date: "March, 2004", image: nil),
            TimeFrame(text: "I saw for first time an iMac in the school's IT lab and I discovered that computers could be awesome, not like windows computers we had in home that were full of malware and were difficult to use.", date: "March, 2006",  image: UIImage(named: "imacg3")),
            TimeFrame(text: "I tried an iPhone for first time, and I loved it. I wanted to buy one as soon as possible", date: "April 2008", image: UIImage(named: "firstIPhone")),
            TimeFrame(text: "My father bought an iMac for the family. I became really interested into the Tech world.", date: "December 2009", image: nil),
            TimeFrame(text: "I bought an iPod Touch and started downloading hundreds of apps, that was the first moment when I wanted to create software for this device.", date: "December 2010", image: nil),
            TimeFrame(text: "I started learning Objective-C on my own, as my first programming language.", date: "October 2011", image: nil),
            TimeFrame(text: "I moved from Chile to Uruguay.", date: "December 2011", image: UIImage(named: "uruguay")),
            TimeFrame(text: "I released my first iPhone app called SPORTIE. This app it is a calories burned calculator which supports different sports and activities.", date: "March 2013", image: nil),
            TimeFrame(text: "I attended the Apple WWDC 2014 as a scholarship winner. This was definitely the best experience in my whole life. I met people from different cultures and learned a lot.", date: "June, 2014", image: UIImage(named: "wwdc14"))
            ])
        timeline.titleLabelColor=UIColor(red: 41.0/255.0, green: 128.0/255.0, blue: 185.0/255.0, alpha: 1.0)
        
        aboutMeContentScrollView.addSubview(timeline)
        aboutMeContentScrollView.addConstraints([
            NSLayoutConstraint(item: timeline, attribute: .Left, relatedBy: .Equal, toItem: aboutMeContentScrollView, attribute: .Left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: timeline, attribute: .Bottom, relatedBy: .LessThanOrEqual, toItem: aboutMeContentScrollView, attribute: .Bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: timeline, attribute: .Top, relatedBy: .Equal, toItem: aboutMeContentScrollView, attribute: .Top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: timeline, attribute: .Right, relatedBy: .Equal, toItem: aboutMeContentScrollView, attribute: .Right, multiplier: 1.0, constant: 5),
            
            NSLayoutConstraint(item: timeline, attribute: .Width, relatedBy: .Equal, toItem: aboutMeContentScrollView, attribute: .Width, multiplier: 1.0, constant: -5)
            ])
        
        
        //Education Card
        educationContent.hidden=true
        carrouselScrollView.delegate=self
        
        educationSchoolInfoTextView.delegate=self
        
        var viewProportion = self.cousinView.frame.width/self.view.frame.width
        educationSchoolInfoTextView.text="In this moment, I am studying in Preuniversiario Carrasco, an IB school. Here I have a lot of friends and learn something new every single day. It is a small school but has great people.\nPreuniversitario Carrasco is a bilingual educational institution which strives to nurture and enhance its students' whole development providing personalized learning within a safe and empowering environment of trust, respect and high academic standards.\nNext year I will continue the course through the scientific orientation and if everything goes well I will graduate in two more years."
        educationSchoolInfoTextView.font=UIFont(name: "AvenirNext-Regular", size: 19)
        educationSchoolInfoTextView.editable=false
        educationSchoolInfoTextView.selectable=false
        educationSchoolInfoTextView.textContainerInset = UIEdgeInsetsMake(0, 17, 20, 17);
        educationSchoolTitleLabel.font=UIFont(name: educationSchoolTitleLabel.font.fontName, size: viewProportion*21)
        
        
        //Interests Card
        self.interestMusicText.font=UIFont(name: self.interestMusicText.font.fontName, size: 16/320*self.view.frame.width)
        self.interestMusicImage.frame=CGRectMake(20, 25, 60, 60)
        self.interestMusicText.frame=CGRectMake(100, 20, cousinView.frame.width-120, 100/320*self.view.frame.width)
        self.interestMusicText.sizeToFit()
        
        self.interestPhotographyText.font=UIFont(name: self.interestMusicText.font.fontName, size: 16/320*self.view.frame.width)
        self.interestPhotographyImage.frame=CGRectMake(20, 165-interestsTextsPadding, 60, 60)
        self.interestPhotographyText.frame=CGRectMake(100, 160-interestsTextsPadding, cousinView.frame.width-120, 80/320*self.view.frame.width)
        self.interestPhotographyText.sizeToFit()
        
        self.interestSoccerText.font=UIFont(name: self.interestMusicText.font.fontName, size: 16/320*self.view.frame.width)
        self.interestSoccerImage.frame=CGRectMake(20, 285-interestsTextsPadding, 60, 60)
        self.interestSoccerText.frame=CGRectMake(100, 280-interestsTextsPadding, self.cousinView.frame.width-120, 80/320*self.view.frame.width)
        self.interestSoccerText.sizeToFit()
        
        self.interestTechText.font=UIFont(name: self.interestMusicText.font.fontName, size: 16/320*self.view.frame.width)
        self.interestTechImage.frame=CGRectMake(20, 410-interestsTextsPadding, 60, 60)
        self.interestTechText.frame=CGRectMake(100, 400-interestsTextsPadding, cousinView.frame.width-120, 100/320*self.view.frame.width)
        self.interestTechText.sizeToFit()
        
        
        interestMusicImage.layer.masksToBounds=true
        interestMusicImage.layer.cornerRadius=interestMusicImage.frame.width/2
        interestPhotographyImage.layer.masksToBounds=true
        interestPhotographyImage.layer.cornerRadius=interestPhotographyImage.frame.width/2
        interestSoccerImage.layer.masksToBounds=true
        interestSoccerImage.layer.cornerRadius=interestSoccerImage.frame.width/2
        interestTechImage.layer.masksToBounds=true
        interestTechImage.layer.cornerRadius=interestTechImage.frame.width/2
        
        
        //Projects View
        projectsTableView.delegate=self
        projectsTableView.dataSource=self
        projectsTableView.estimatedRowHeight=66.0
        projectsTableView.rowHeight=UITableViewAutomaticDimension
        projectsTitles = NSArray(objects: "SPORTIE","BiTra","Abrakadabra","Stocky", "Just Touch","Boost The Ball")
        projectsDescriptions = NSArray(objects: "SPORTIE is a calories burned calculator based on different activities and sports, your weight and the practice time","The best binary code translator available for iPhone, iPad and iPod Touch.\nYou have a binary code and you want to know what means in our language? Don`t worry, BiTra is the solution to your problem. It has an incredible UI for making the experience more comfortable","This is a Spanish iDevice guide with tricks and tips to use your iPhone, iPad and iPod Touch as best as you can","Stocky is a minimalist and complete shares manager.\nWith stocky you are able to follow companies as a stockholder or simply as a follower having different kind of features with each one.", "Just Touch is a simple game in which you should touch each color as fast as you can without repeating the same color, be aware that the colors change of position!","Boost the ball and try to pass across the black sliders without touching them and without falling down. You can touch the walls. If you touch at the bottom of the ball, the ball will go up, simply touch in the opposite direction of the point you want to reach.\nIt looks easy, but I beat you that you can't get more than 10 points!")
        projectsImages = NSArray(objects: "SPORTIEicon","BiTraicon","Abrakadabraicon","Stockyicon", "JustTouchicon","BoostTheBallicon")
        projectsLinks = NSArray(objects: "https://itunes.apple.com/us/app/sportie/id612373180?ls=1&mt=8","https://itunes.apple.com/us/app/bitra-the-binary-translator/id670046129?ls=1&mt=8","https://itunes.apple.com/us/app/abrakadabra-trucos-para-iphone/id699398266?ls=1&mt=8","https://itunes.apple.com/us/app/stocky-for-iphone/id872597940?ls=1&mt=8", "https://itunes.apple.com/us/app/just-touch/id926073053?ls=1&mt=8","https://itunes.apple.com/us/app/boost-the-ball/id958352073?ls=1&mt=8")
        
    }
    func loadSocialCardSubview(){
        //Social Card
        
        twitterButton.layer.masksToBounds=true
        facebookButton.layer.masksToBounds=true
        instagramButton.layer.masksToBounds=true
        skypeButton.layer.masksToBounds=true
        linkedinButton.layer.masksToBounds=true
        websiteButton.layer.masksToBounds=true
        mailButton.layer.masksToBounds=true
        socialButtonsHidder.layer.masksToBounds=true
        
        twitterButton.layer.cornerRadius=twitterButton.frame.width/2
        facebookButton.layer.cornerRadius=twitterButton.frame.width/2
        instagramButton.layer.cornerRadius=twitterButton.frame.width/2
        skypeButton.layer.cornerRadius=twitterButton.frame.width/2
        linkedinButton.layer.cornerRadius=twitterButton.frame.width/2
        websiteButton.layer.cornerRadius=twitterButton.frame.width/2
        mailButton.layer.cornerRadius=twitterButton.frame.width/2
        socialButtonsHidder.layer.cornerRadius=twitterButton.frame.width/2
    }
    
    @IBAction func prevCard(sender: AnyObject) {
        
        var currentPage = floor(cardsScrollView.contentOffset.x/cardsScrollView.frame.width)
        
        if(cardsScrollView.contentOffset.x>=cardsScrollView.frame.size.width){
            cardsScrollView .setContentOffset(CGPointMake((currentPage-1)*cardsScrollView.frame.size.width, 0), animated: true)
            
        }
        
    }
    @IBAction func nextCard(sender: AnyObject) {
        
        var currentPage = ceil(cardsScrollView.contentOffset.x/cardsScrollView.frame.width)
        
        if(currentPage<4){
            cardsScrollView .setContentOffset(CGPointMake((currentPage+1)*cardsScrollView.frame.size.width, 0), animated: true)
        }
    }
    
    // MARK: - Touched Cards Methods

    func updateAfterTransition(){
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            println("Rounded corners deleted")
            self.cousinView.layer.cornerRadius=0
        })
        UIView.animateWithDuration(0.35, delay: 0.15, options: UIViewAnimationOptions.CurveEaseIn, animations:{ () -> Void in
            
            self.cousinLabelX.constant=(self.view.frame.size.width-self.cousinViewTitle.frame.size.width)/2
            self.cousinLabelY.constant=30
            self.cousinViewTitle.layoutIfNeeded()
            
            }) { (Bool) -> Void in
                println("First text animation done!")
                self.cousinViewTitle.font=UIFont(name: self.cousinViewTitle.font.fontName, size: 30)
                self.cousinViewTitle.transform = CGAffineTransformScale(self.cousinViewTitle.transform, 23/30, 23/30)
                UIView.animateWithDuration(0.25, delay: 0.3, options: UIViewAnimationOptions.CurveEaseInOut, animations:{ () -> Void in
                    
                    self.cousinViewTitle.transform = CGAffineTransformScale(self.cousinViewTitle.transform, 30/23, 30/23)
                    
                    }) { (Bool) -> Void in
                        println("Second text animation done!")
                        
                        if (self.cousinViewTitle.text=="About Me"){
                            self.loadAboutMeView()
                        }
                        else if (self.cousinViewTitle.text=="Education"){
                            self.loadEducationView()
                        }
                        else if (self.cousinViewTitle.text=="Projects"){
                            self.loadProjectsView()
                        }
                        else if (self.cousinViewTitle.text=="Social"){
                            self.loadSocialView()
                        }
                        else if (self.cousinViewTitle.text=="Interests"){
                            self.loadInterestsView()
                        }
                        
                }
                
        }
    }
    
    @IBAction func bioCardTouched(sender: AnyObject) {
        println("About Me")
        //Get card frame in main view
        var nwFra = cardsContentView.convertRect(biographyCard.frame, toView: view)
        var lbl = biographyCard.viewWithTag(3) as! UILabel
        var nwFraTitle = biographyCard.convertRect(lbl.frame, toView: view)
        
        //Configure alternative view
        cousinViewTitle.text="About Me"
        cousinWidth.constant=nwFra.size.width
        cousinHeight.constant=nwFra.size.height
        cousinXAlign.constant=nwFra.origin.x
        cousinYAlign.constant=nwFra.origin.y
        cousinView.layoutIfNeeded()
        
        self.cousinLabelX.constant=nwFraTitle.origin.x
        self.cousinLabelY.constant=nwFraTitle.origin.y
        openedViewTitlePosition=nwFraTitle.origin.y
        self.cousinLabelWidth.constant=nwFraTitle.size.width
        self.cousinLabelHeight.constant=nwFraTitle.size.height
        self.cousinViewTitle.layoutIfNeeded()
        
        cousinView.hidden=false
        cousinViewTitle.hidden=false
        biographyCard.hidden=true
        leftNavButton.enabled=false
        rightNavButton.enabled=false
        
        //Start animations
        UIView.animateWithDuration(0.25, delay: 0, options: nil, animations:{ () -> Void in
            
            self.cousinWidth.constant=self.biographyCard.frame.width+30
            self.cousinHeight.constant=self.biographyCard.frame.height+30
            self.cousinXAlign.constant=(self.view.frame.size.width-(self.biographyCard.frame.width+30))/2
            self.cousinYAlign.constant=(self.view.frame.size.height-(self.biographyCard.frame.height+30))/2
            
            self.cousinView.layoutIfNeeded()
            
            
            self.cousinView.layer.shadowRadius = 9.0;
            self.cousinView.layer.shadowOpacity = 0.70;
            
            }) { (Bool) -> Void in
                println("First animation done!")
                
                UIView.animateWithDuration(0.35, delay: 0.15, options: nil, animations:{ () -> Void in
                    
                        self.scrollViewTopConst.constant=self.view.frame.size.height
                        self.cardsScrollView.layoutIfNeeded()
                    
                    }) { (Bool) -> Void in
                        println("Second animation done!")

                        UIView.animateWithDuration(0.06, delay: 0.15, options: UIViewAnimationOptions.CurveEaseOut, animations:{ () -> Void in
                            
                            self.cousinWidth.constant=self.biographyCard.frame.width-6
                            self.cousinHeight.constant=self.biographyCard.frame.height-6
                            self.cousinXAlign.constant=(self.view.frame.size.width-(self.biographyCard.frame.width-6))/2
                            self.cousinYAlign.constant=(self.view.frame.size.height-(self.biographyCard.frame.height-6))/2
                            
                            self.cousinView.layoutIfNeeded()
                            
                            self.cousinView.layer.shadowRadius = 6.0;
                            self.cousinView.layer.shadowOpacity = 0.5;
                            
                            }) { (Bool) -> Void in
                                println("Third animation done!")
                                UIView.animateWithDuration(0.25, delay: 0.05, options: UIViewAnimationOptions.CurveEaseInOut, animations:{ () -> Void in
                                    
                                    self.cousinWidth.constant=self.view.frame.size.width
                                    self.cousinHeight.constant=self.view.frame.size.height
                                    self.cousinXAlign.constant=0
                                    self.cousinYAlign.constant=0
                                    
                                    self.cousinView.layoutIfNeeded()
                                    
                                    
                                    }) { (Bool) -> Void in
                                        println("Forth and final transition animation done!")
                                        self.updateAfterTransition()
                                }
                        }
                        
                }
                
        }
    }
    @IBAction func eduCardTouched(sender: AnyObject) {
        println("Education")

        //Get card frame in main view
        var nwFra = cardsContentView.convertRect(educationCard.frame, toView: view)
        var lbl = educationCard.viewWithTag(3)as! UILabel
        var nwFraTitle = educationCard.convertRect(lbl.frame, toView: view)
        
        //Configure alternative view
        cousinViewTitle.text="Education"
        cousinWidth.constant=nwFra.size.width
        cousinHeight.constant=nwFra.size.height
        cousinXAlign.constant=nwFra.origin.x
        cousinYAlign.constant=nwFra.origin.y
        cousinView.layoutIfNeeded()
        
        self.cousinLabelX.constant=nwFraTitle.origin.x
        self.cousinLabelY.constant=nwFraTitle.origin.y
        openedViewTitlePosition=nwFraTitle.origin.y
        self.cousinLabelWidth.constant=nwFraTitle.size.width
        self.cousinLabelHeight.constant=nwFraTitle.size.height
        self.cousinViewTitle.layoutIfNeeded()
        
        cousinView.hidden=false
        cousinViewTitle.hidden=false
        educationCard.hidden=true
        leftNavButton.enabled=false
        rightNavButton.enabled=false
        
        //Start animations
        UIView.animateWithDuration(0.25, delay: 0, options: nil, animations:{ () -> Void in
            
            self.cousinWidth.constant=self.educationCard.frame.width+30
            self.cousinHeight.constant=self.educationCard.frame.height+30
            self.cousinXAlign.constant=(self.view.frame.size.width-(self.educationCard.frame.width+30))/2
            self.cousinYAlign.constant=(self.view.frame.size.height-(self.educationCard.frame.height+30))/2
            
            self.cousinView.layoutIfNeeded()
            
            
            self.cousinView.layer.shadowRadius = 9.0;
            self.cousinView.layer.shadowOpacity = 0.70;
            
            }) { (Bool) -> Void in
                println("First animation done!")
                
                UIView.animateWithDuration(0.35, delay: 0.15, options: nil, animations:{ () -> Void in
                    
                    self.scrollViewTopConst.constant=self.view.frame.size.height
                    self.cardsScrollView.layoutIfNeeded()
                    
                    }) { (Bool) -> Void in
                        println("Second animation done!")
                        
                        UIView.animateWithDuration(0.06, delay: 0.15, options: UIViewAnimationOptions.CurveEaseOut, animations:{ () -> Void in
                            
                            self.cousinWidth.constant=self.educationCard.frame.width-6
                            self.cousinHeight.constant=self.educationCard.frame.height-6
                            self.cousinXAlign.constant=(self.view.frame.size.width-(self.educationCard.frame.width-6))/2
                            self.cousinYAlign.constant=(self.view.frame.size.height-(self.educationCard.frame.height-6))/2
                            
                            self.cousinView.layoutIfNeeded()
                            
                            self.cousinView.layer.shadowRadius = 6.0;
                            self.cousinView.layer.shadowOpacity = 0.5;
                            
                            }) { (Bool) -> Void in
                                println("Third animation done!")
                                UIView.animateWithDuration(0.25, delay: 0.05, options: UIViewAnimationOptions.CurveEaseInOut, animations:{ () -> Void in
                                    
                                    self.cousinWidth.constant=self.view.frame.size.width
                                    self.cousinHeight.constant=self.view.frame.size.height
                                    self.cousinXAlign.constant=0
                                    self.cousinYAlign.constant=0
                                    
                                    self.cousinView.layoutIfNeeded()
                                    
                                    var viewProportion = self.cousinView.frame.width/self.view.frame.width

                                    self.educationSchoolTitleLabel.font=UIFont(name: self.educationSchoolTitleLabel.font.fontName, size: viewProportion*21)

                                    
                                    }) { (Bool) -> Void in
                                        println("Forth and final transition animation done!")
                                        self.updateAfterTransition()
                                }
                        }
                        
                }
                
        }

    }
    @IBAction func intCardTouched(sender: AnyObject) {
        println("Interests")

        //Get card frame in main view
        var nwFra = cardsContentView.convertRect(interestsCard.frame, toView: view)
        var lbl = interestsCard.viewWithTag(3) as! UILabel
        var nwFraTitle = interestsCard.convertRect(lbl.frame, toView: view)
        
        //Configure alternative view
        cousinViewTitle.text="Interests"
        cousinWidth.constant=nwFra.size.width
        cousinHeight.constant=nwFra.size.height
        cousinXAlign.constant=nwFra.origin.x
        cousinYAlign.constant=nwFra.origin.y
        cousinView.layoutIfNeeded()
        
        self.cousinLabelX.constant=nwFraTitle.origin.x
        self.cousinLabelY.constant=nwFraTitle.origin.y
        openedViewTitlePosition=nwFraTitle.origin.y
        self.cousinLabelWidth.constant=nwFraTitle.size.width
        self.cousinLabelHeight.constant=nwFraTitle.size.height
        self.cousinViewTitle.layoutIfNeeded()
        
        cousinView.hidden=false
        cousinViewTitle.hidden=false
        interestsCard.hidden=true
        leftNavButton.enabled=false
        rightNavButton.enabled=false
        
        //Start animations
        UIView.animateWithDuration(0.25, delay: 0, options: nil, animations:{ () -> Void in
            
            self.cousinWidth.constant=self.interestsCard.frame.width+30
            self.cousinHeight.constant=self.interestsCard.frame.height+30
            self.cousinXAlign.constant=(self.view.frame.size.width-(self.interestsCard.frame.width+30))/2
            self.cousinYAlign.constant=(self.view.frame.size.height-(self.interestsCard.frame.height+30))/2
            
            self.cousinView.layoutIfNeeded()
            
            
            self.cousinView.layer.shadowRadius = 9.0;
            self.cousinView.layer.shadowOpacity = 0.70;
            
            }) { (Bool) -> Void in
                println("First animation done!")
                
                UIView.animateWithDuration(0.35, delay: 0.15, options: nil, animations:{ () -> Void in
                    
                    self.scrollViewTopConst.constant=self.view.frame.size.height
                    self.cardsScrollView.layoutIfNeeded()
                    
                    }) { (Bool) -> Void in
                        println("Second animation done!")
                        
                        UIView.animateWithDuration(0.06, delay: 0.15, options: UIViewAnimationOptions.CurveEaseOut, animations:{ () -> Void in
                            
                            self.cousinWidth.constant=self.interestsCard.frame.width-6
                            self.cousinHeight.constant=self.interestsCard.frame.height-6
                            self.cousinXAlign.constant=(self.view.frame.size.width-(self.interestsCard.frame.width-6))/2
                            self.cousinYAlign.constant=(self.view.frame.size.height-(self.interestsCard.frame.height-6))/2
                            
                            self.cousinView.layoutIfNeeded()
                            
                            self.cousinView.layer.shadowRadius = 6.0;
                            self.cousinView.layer.shadowOpacity = 0.5;
                            
                            }) { (Bool) -> Void in
                                println("Third animation done!")
                                UIView.animateWithDuration(0.25, delay: 0.05, options: UIViewAnimationOptions.CurveEaseInOut, animations:{ () -> Void in
                                    
                                    self.cousinWidth.constant=self.view.frame.size.width
                                    self.cousinHeight.constant=self.view.frame.size.height
                                    self.cousinXAlign.constant=0
                                    self.cousinYAlign.constant=0
                                    
                                    self.cousinView.layoutIfNeeded()
                                    
                                    
                                    }) { (Bool) -> Void in
                                        println("Forth and final transition animation done!")
                                        self.updateAfterTransition()
                                }
                        }
                        
                }
                
        }

    }
    @IBAction func projCardTouched(sender: AnyObject) {
        println("Projects")

        //Get card frame in main view
        var nwFra = cardsContentView.convertRect(projectsCard.frame, toView: view)
        var lbl = projectsCard.viewWithTag(3) as! UILabel
        var nwFraTitle = projectsCard.convertRect(lbl.frame, toView: view)
        
        //Configure alternative view
        cousinViewTitle.text="Projects"
        cousinWidth.constant=nwFra.size.width
        cousinHeight.constant=nwFra.size.height
        cousinXAlign.constant=nwFra.origin.x
        cousinYAlign.constant=nwFra.origin.y
        cousinView.layoutIfNeeded()
        
        self.cousinLabelX.constant=nwFraTitle.origin.x
        self.cousinLabelY.constant=nwFraTitle.origin.y
        openedViewTitlePosition=nwFraTitle.origin.y
        self.cousinLabelWidth.constant=nwFraTitle.size.width
        self.cousinLabelHeight.constant=nwFraTitle.size.height
        self.cousinViewTitle.layoutIfNeeded()
        
        cousinView.hidden=false
        cousinViewTitle.hidden=false
        projectsCard.hidden=true
        leftNavButton.enabled=false
        rightNavButton.enabled=false
        
        //Start animations
        UIView.animateWithDuration(0.25, delay: 0, options: nil, animations:{ () -> Void in
            
            self.cousinWidth.constant=self.projectsCard.frame.width+30
            self.cousinHeight.constant=self.projectsCard.frame.height+30
            self.cousinXAlign.constant=(self.view.frame.size.width-(self.projectsCard.frame.width+30))/2
            self.cousinYAlign.constant=(self.view.frame.size.height-(self.projectsCard.frame.height+30))/2
            
            self.cousinView.layoutIfNeeded()
            
            
            self.cousinView.layer.shadowRadius = 9.0;
            self.cousinView.layer.shadowOpacity = 0.70;
            
            }) { (Bool) -> Void in
                println("First animation done!")
                
                UIView.animateWithDuration(0.35, delay: 0.15, options: nil, animations:{ () -> Void in
                    
                    self.scrollViewTopConst.constant=self.view.frame.size.height
                    self.cardsScrollView.layoutIfNeeded()
                    
                    }) { (Bool) -> Void in
                        println("Second animation done!")
                        
                        UIView.animateWithDuration(0.06, delay: 0.15, options: UIViewAnimationOptions.CurveEaseOut, animations:{ () -> Void in
                            
                            self.cousinWidth.constant=self.projectsCard.frame.width-6
                            self.cousinHeight.constant=self.projectsCard.frame.height-6
                            self.cousinXAlign.constant=(self.view.frame.size.width-(self.projectsCard.frame.width-6))/2
                            self.cousinYAlign.constant=(self.view.frame.size.height-(self.projectsCard.frame.height-6))/2
                            
                            self.cousinView.layoutIfNeeded()
                            
                            self.cousinView.layer.shadowRadius = 6.0;
                            self.cousinView.layer.shadowOpacity = 0.5;
                            
                            }) { (Bool) -> Void in
                                println("Third animation done!")
                                UIView.animateWithDuration(0.25, delay: 0.05, options: UIViewAnimationOptions.CurveEaseInOut, animations:{ () -> Void in
                                    
                                    self.cousinWidth.constant=self.view.frame.size.width
                                    self.cousinHeight.constant=self.view.frame.size.height
                                    self.cousinXAlign.constant=0
                                    self.cousinYAlign.constant=0
                                    
                                    self.cousinView.layoutIfNeeded()
                                    
                                    
                                    }) { (Bool) -> Void in
                                        println("Forth and final transition animation done!")
                                        self.updateAfterTransition()
                                }
                        }
                        
                }
                
        }
        
    }
    @IBAction func sociCardTouched(sender: AnyObject) {
        println("Social Networks")

        //Get card frame in main view
        var nwFra = cardsContentView.convertRect(socialCard.frame, toView: view)
        var lbl = socialCard.viewWithTag(3) as! UILabel
        var nwFraTitle = socialCard.convertRect(lbl.frame, toView: view)
        
        //Configure alternative view
        cousinViewTitle.text="Social"
        cousinWidth.constant=nwFra.size.width
        cousinHeight.constant=nwFra.size.height
        cousinXAlign.constant=nwFra.origin.x
        cousinYAlign.constant=nwFra.origin.y
        cousinView.layoutIfNeeded()
        
        self.cousinLabelX.constant=nwFraTitle.origin.x
        self.cousinLabelY.constant=nwFraTitle.origin.y
        openedViewTitlePosition=nwFraTitle.origin.y
        self.cousinLabelWidth.constant=nwFraTitle.size.width
        self.cousinLabelHeight.constant=nwFraTitle.size.height
        self.cousinViewTitle.layoutIfNeeded()
        
        cousinView.hidden=false
        cousinViewTitle.hidden=false
        socialCard.hidden=true
        leftNavButton.enabled=false
        rightNavButton.enabled=false
        
        //Start animations
        UIView.animateWithDuration(0.25, delay: 0, options: nil, animations:{ () -> Void in
            
            self.cousinWidth.constant=self.socialCard.frame.width+30
            self.cousinHeight.constant=self.socialCard.frame.height+30
            self.cousinXAlign.constant=(self.view.frame.size.width-(self.socialCard.frame.width+30))/2
            self.cousinYAlign.constant=(self.view.frame.size.height-(self.socialCard.frame.height+30))/2
            
            self.cousinView.layoutIfNeeded()
            
            
            self.cousinView.layer.shadowRadius = 9.0;
            self.cousinView.layer.shadowOpacity = 0.70;
            
            }) { (Bool) -> Void in
                println("First animation done!")
                
                UIView.animateWithDuration(0.35, delay: 0.15, options: nil, animations:{ () -> Void in
                    
                    self.scrollViewTopConst.constant=self.view.frame.size.height
                    self.cardsScrollView.layoutIfNeeded()
                    
                    }) { (Bool) -> Void in
                        println("Second animation done!")
                        
                        UIView.animateWithDuration(0.06, delay: 0.15, options: UIViewAnimationOptions.CurveEaseOut, animations:{ () -> Void in
                            
                            self.cousinWidth.constant=self.socialCard.frame.width-6
                            self.cousinHeight.constant=self.socialCard.frame.height-6
                            self.cousinXAlign.constant=(self.view.frame.size.width-(self.socialCard.frame.width-6))/2
                            self.cousinYAlign.constant=(self.view.frame.size.height-(self.socialCard.frame.height-6))/2
                            
                            self.cousinView.layoutIfNeeded()
                            
                            self.cousinView.layer.shadowRadius = 6.0;
                            self.cousinView.layer.shadowOpacity = 0.5;
                            
                            }) { (Bool) -> Void in
                                println("Third animation done!")
                                UIView.animateWithDuration(0.25, delay: 0.05, options: UIViewAnimationOptions.CurveEaseInOut, animations:{ () -> Void in
                                    
                                    self.cousinWidth.constant=self.view.frame.size.width
                                    self.cousinHeight.constant=self.view.frame.size.height
                                    self.cousinXAlign.constant=0
                                    self.cousinYAlign.constant=0
                                    
                                    self.cousinView.layoutIfNeeded()
                                    
                                    
                                    }) { (Bool) -> Void in
                                        println("Forth and final transition animation done!")
                                        self.updateAfterTransition()
                                }
                        }
                        
                }
                
        }
    }
    
    
    // MARK: - Close Cards Methods

    func resetTheMainView(){
        
        //Start animations
        UIView.animateWithDuration(0.35, delay: 0.15, options: nil, animations:{ () -> Void in
                    
                self.scrollViewTopConst.constant=0
                self.cardsScrollView.layoutIfNeeded()
                    
                }) { (Bool) -> Void in
                    println("Reset animation done!")
                    self.cousinView.hidden=true
                    self.cousinViewTitle.hidden=true
                    self.biographyCard.hidden=false
                    self.educationCard.hidden=false
                    self.interestsCard.hidden=false
                    self.projectsCard.hidden=false
                    self.socialCard.hidden=false
                    self.leftNavButton.enabled=true
                    self.rightNavButton.enabled=true
                    self.cardsScrollView.scrollEnabled=true
                    self.cardsScrollView.userInteractionEnabled=true
                    self.cousinViewTitle=self.cousinViewTitleTwin
                    self.cousinViewTitle.font=UIFont(name: self.cousinViewTitle.font.fontName, size: 23)
                    self.cousinViewTitle.transform = CGAffineTransformScale(self.cousinViewTitle.transform, (30/23), (30/23))
                    self.textInSmallVersion=false
                    self.aboutMeContentScrollView.hidden=true
                    self.aboutMeContentScrollView.setContentOffset(CGPointZero, animated: false)
                    self.interestsScrollView.setContentOffset(CGPointZero, animated: false)
                
                    self.educationSchoolInfoTextView.setContentOffset(CGPointZero, animated: false)
                    self.educationContent.hidden=true
                    
                    self.socialContainer.hidden=true
                    self.interestsContainer.hidden=true

                    self.socialButtonsHidder.hidden=true
                    self.socialButtonsHidder.alpha=1
                    
                    self.twiiterYConstrait.constant=0
                    self.twiiterXConstrait.constant=0
                    self.facebookXConstrait.constant=0
                    self.facebookYConstrait.constant=0
                    self.instagramXConstrait.constant=0
                    self.instagramYConstrait.constant=0
                    self.linkedinXConstrait.constant=0
                    self.linkedinYConstrait.constant=0
                    self.skypeXConstrait.constant=0
                    self.skypeYConstrait.constant=0
                    self.mailXConstrait.constant=0
                    self.mailYConstrait.constant=0
                    self.websiteXConstrait.constant=0
                    self.websiteYConstrait.constant=0
                    self.socialButtonsHidderY.constant=0
                    
                    self.twitterButton.layoutIfNeeded()
                    self.facebookButton.layoutIfNeeded()
                    self.instagramButton.layoutIfNeeded()
                    self.linkedinButton.layoutIfNeeded()
                    self.skypeButton.layoutIfNeeded()
                    self.mailButton.layoutIfNeeded()
                    self.websiteButton.layoutIfNeeded()
                    self.socialButtonsHidder.layoutIfNeeded()
                    self.interestsContainer.layoutIfNeeded()
                    
                    self.projectsTableView.layoutIfNeeded()
                    self.projectsTableView.hidden=true
                    self.projectsTableView.alpha=1
                    
                }
    }
    
    //Close views with a pinch gesture
    //Warning : show an alert which tells about pinch
    @IBAction func pinchToClose(sender: UIPinchGestureRecognizer) {
        var minCardForClose : CGFloat
        minCardForClose = view.frame.height-50
        if view.frame.width>320{
            minCardForClose = view.frame.height-120
        }
        
        if(sender.state==UIGestureRecognizerState.Ended){
            
            if sender.scale*cousinHeight.constant>minCardForClose{
                //Cancel movement
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.cousinXAlign.constant=0
                    self.cousinYAlign.constant=0
                    self.cousinWidth.constant=self.view.frame.width
                    self.cousinHeight.constant=self.view.frame.height
                    self.cousinView.layoutIfNeeded()
                    self.cousinLabelY.constant=30
                    self.cousinViewTitle.layoutIfNeeded()
                    self.aboutMeContentScrollView.alpha=1
                    self.educationContent.alpha=1
                    var viewProportion : CGFloat = 1
                    
                    self.educationSchoolTitleLabel.font=UIFont(name: self.educationSchoolTitleLabel.font.fontName, size: viewProportion*21)
                    self.socialContainer.alpha=1
                    self.interestsContainer.alpha=1
                    
                    self.interestMusicText.font=UIFont(name: self.interestMusicText.font.fontName, size: 16/320*self.view.frame.width)
                    self.interestMusicImage.frame=CGRectMake(20, 25, 60, 60)
                    self.interestMusicText.frame=CGRectMake(100, 20, self.cousinView.frame.width-120, 100/320*self.view.frame.width)
                    self.interestMusicText.sizeToFit()

                    
                    self.interestPhotographyText.font=UIFont(name: self.interestMusicText.font.fontName, size: 16/320*self.view.frame.width)
                    self.interestPhotographyImage.frame=CGRectMake(20, 165-self.interestsTextsPadding, 60, 60)
                    self.interestPhotographyText.frame=CGRectMake(100, 160-self.interestsTextsPadding, self.cousinView.frame.width-120, 80/320*self.view.frame.width)
                    self.interestPhotographyText.sizeToFit()

                    
                    self.interestSoccerText.font=UIFont(name: self.interestMusicText.font.fontName, size: 16/320*self.view.frame.width)
                    self.interestSoccerImage.frame=CGRectMake(20, 285-self.interestsTextsPadding, 60, 60)
                    self.interestSoccerText.frame=CGRectMake(100, 280-self.interestsTextsPadding, self.cousinView.frame.width-120, 80/320*self.view.frame.width)
                    self.interestSoccerText.sizeToFit()
                    
                    
                    self.interestTechText.font=UIFont(name: self.interestMusicText.font.fontName, size: 16/320*self.view.frame.width)
                    self.interestTechImage.frame=CGRectMake(20, 410-self.interestsTextsPadding, 60, 60)
                    self.interestTechText.frame=CGRectMake(100, 400-self.interestsTextsPadding, self.cousinView.frame.width-120, 100/320*self.view.frame.width)
                    self.interestTechText.sizeToFit()
                    
                    if (self.textInSmallVersion==true){
                        self.cousinViewTitle.transform = CGAffineTransformScale(self.cousinViewTitle.transform, (30/23), (30/23))
                        self.textInSmallVersion=false
                    }
                    
                    self.projectsTableView.alpha=1

                    
                }, completion: { (Bool) -> Void in
                    self.cousinView.layer.cornerRadius=0
                })
            }
            else{
                //Finish movement
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.cousinWidth.constant=224
                    self.cousinHeight.constant=397
                    self.cousinXAlign.constant=(self.view.frame.width-self.cousinWidth.constant)/2
                    self.cousinYAlign.constant=(self.view.frame.height-self.cousinHeight.constant)/2
                    self.cousinView.layoutIfNeeded()
                    self.cousinLabelY.constant=max(min(self.openedViewTitlePosition, self.openedViewTitlePosition*1),30)
                    self.cousinViewTitle.layoutIfNeeded()
                    self.aboutMeContentScrollView.alpha=0
                    self.educationContent.alpha=0
                    
                    var viewProportion : CGFloat = 0
                    
                    self.educationSchoolTitleLabel.font=UIFont(name: self.educationSchoolTitleLabel.font.fontName, size: viewProportion*21)
                    self.socialContainer.alpha=0
                    self.interestsContainer.alpha=0
                    self.projectsTableView.alpha=0

                    }, completion: { (Bool) -> Void in
                        //Reset the initialView
                        self.resetTheMainView()
                })
            }
            
            return;
        }
        
        
        if (sender.scale*cousinWidth.constant<=224){
            cousinWidth.constant=224
        }
        else{
            cousinWidth.constant=sender.scale*cousinWidth.constant
            
            if (textInSmallVersion==false){
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    self.cousinViewTitle.transform = CGAffineTransformScale(self.cousinViewTitle.transform, (23/30), (23/30))
                    
                    }, completion: { (Bool) -> Void in
                        //self.cousinViewTitle.font=UIFont(name: self.cousinViewTitle.font.fontName, size: 23)
                })
                textInSmallVersion=true
            }
            
        }
        if (sender.scale*cousinHeight.constant<=397){
            cousinHeight.constant=397
        }
        else{
            cousinHeight.constant=sender.scale*cousinHeight.constant
        }
        
        //Bigger than screen, cancel movement
        if (cousinWidth.constant>view.frame.width){
            if(sender.scale*cousinHeight.constant>view.frame.height-120){
                //Cancel movement
                    self.cousinXAlign.constant=0
                    self.cousinYAlign.constant=0
                    self.cousinWidth.constant=self.view.frame.width
                    self.cousinHeight.constant=self.view.frame.height
                    self.cousinView.layoutIfNeeded()
                    self.cousinView.layer.cornerRadius=0
            }
        }
        
        var percent = ((((view.frame.width-cousinWidth.constant)/2)/(view.frame.width-224)/2))*4
        var percentForContentAlpha = ((((view.frame.width-cousinWidth.constant)/2)/(view.frame.width-250)/2))*4
        var percentForSocialContentAlpha = ((((view.frame.width-cousinWidth.constant)/2)/(view.frame.width-280)/2))*4
        
        aboutMeContentScrollView.alpha=1-percentForContentAlpha
        educationContent.alpha=1-percentForContentAlpha
        socialContainer.alpha=1-percentForSocialContentAlpha
        interestsContainer.alpha=1-percentForSocialContentAlpha
        projectsTableView.alpha=1-percentForSocialContentAlpha

        cousinLabelY.constant=max(min(openedViewTitlePosition, openedViewTitlePosition*percent),30)
        cousinViewTitle.layoutIfNeeded()
        
        cousinXAlign.constant=(view.frame.size.width-cousinWidth.constant)/2
        cousinYAlign.constant=(view.frame.size.height-cousinHeight.constant)/2
        cousinView.layer.cornerRadius=5.0*sender.scale
        cousinView.layoutIfNeeded()
        
        var viewProportion = self.cousinView.frame.width/self.view.frame.width
        
        self.interestMusicText.font=UIFont(name: self.interestMusicText.font.fontName, size: (16/320*self.view.frame.width)*viewProportion)
        self.interestMusicImage.frame=CGRectMake(20, 25, 60, 60)
        self.interestMusicText.frame=CGRectMake(100, 20, cousinView.frame.width-120, 100/320*self.view.frame.width)
        self.interestMusicText.sizeToFit()

        self.interestPhotographyText.font=UIFont(name: self.interestMusicText.font.fontName, size: (16/320*self.view.frame.width)*viewProportion)
        self.interestPhotographyImage.frame=CGRectMake(20, 165-interestsTextsPadding, 60, 60)
        self.interestPhotographyText.frame=CGRectMake(100, 160-interestsTextsPadding, cousinView.frame.width-120, 80/320*self.view.frame.width)
        self.interestPhotographyText.sizeToFit()
        
        self.interestSoccerText.font=UIFont(name: self.interestMusicText.font.fontName, size: (16/320*self.view.frame.width)*viewProportion)
        self.interestSoccerImage.frame=CGRectMake(20, 285-interestsTextsPadding, 60, 60)
        self.interestSoccerText.frame=CGRectMake(100, 280-interestsTextsPadding, self.cousinView.frame.width-120, 80/320*self.view.frame.width)
        self.interestSoccerText.sizeToFit()
        
        self.interestTechText.font=UIFont(name: self.interestMusicText.font.fontName, size: (16/320*self.view.frame.width)*viewProportion)
        self.interestTechImage.frame=CGRectMake(20, 410-interestsTextsPadding, 60, 60)
        self.interestTechText.frame=CGRectMake(100, 400-interestsTextsPadding, cousinView.frame.width-120, 100/320*self.view.frame.width)
        self.interestTechText.sizeToFit()

        educationSchoolTitleLabel.font=UIFont(name: educationSchoolTitleLabel.font.fontName, size: viewProportion*21)
        self.educationSchoolInfoTextView.setContentOffset(CGPointZero, animated: false)

        sender.scale = 1
    }
    
    // MARK: - Prompts Methods

    func showFirstPrompt(){
        prompt = SwiftPromptsView(frame: self.view.bounds)
        prompt.delegate = self
        prompt.setMainButtonText("Dismiss")
        prompt.setPromtHeader("Help")
        prompt.setPromptContentText("Swipe between the cards and tap them to learn a bit about me.")
        prompt.setMainButtonColor(UIColor.whiteColor())
        prompt.setColorWithTransparency(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6))
        prompt.setPromptBottomBarColor(UIColor(red: 41.0/255.0, green: 128.0/255.0, blue: 185.0/255.0, alpha: 1.0))
        
        self.view.addSubview(prompt)
    }
    func showPromptForClosingCard(){
        self.prompt = SwiftPromptsView(frame: self.view.bounds)
        self.prompt.delegate = self
        self.prompt.setMainButtonText("Ok")
        self.prompt.setPromtHeader("Help")
        self.prompt.setPromptContentText("In order to dismiss this view, pinch it.")
        self.prompt.setMainButtonColor(UIColor.whiteColor())
        self.prompt.setColorWithTransparency(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6))
        self.prompt.setPromptBottomBarColor(UIColor(red: 41.0/255.0, green: 128.0/255.0, blue: 185.0/255.0, alpha: 1.0))
        
        self.view.addSubview(self.prompt)
    }
    func clickedOnTheMainButton() {
        prompt.dismissPrompt()
    }
    func clickedOnTheSecondButton() {
        prompt.dismissPrompt()
    }
    
   
    
    // MARK: - About Me View Methods

    func loadAboutMeView(){
        aboutMeContentScrollView.layoutIfNeeded()
        aboutMeContentScrollView.alpha=0
        self.aboutMeContentScrollView.hidden=false
        UIView.animateWithDuration(0.4, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.aboutMeContentScrollView.alpha=1
            }) { (Bool) -> Void in
                
                if self.pinchToDismissAlertShowed==false{
                    NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval((1/2)), target: self, selector: "showPromptForClosingCard", userInfo: nil, repeats: false)
                    
                    self.pinchToDismissAlertShowed=true
                }
        }
    }
    
    //MARK: - Education View Methods
    
    func loadEducationView(){
        educationContent.layoutIfNeeded()
        educationContent.alpha=0
        educationContent.hidden=false
        self.carrouselScrollView.setContentOffset(CGPointZero, animated: false)
        self.carrouselPageControl.currentPage=0
        UIView.animateWithDuration(0.4, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.educationContent.alpha=1
            self.carrouselScrollView.setContentOffset(CGPointZero, animated: false)
            }) { (Bool) -> Void in
                if self.pinchToDismissAlertShowed==false{
                    NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval((1/2)), target: self, selector: "showPromptForClosingCard", userInfo: nil, repeats: false)
                    
                    self.pinchToDismissAlertShowed=true
                }
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if (scrollView==carrouselScrollView){
            if Int(ceil(carrouselScrollView.contentOffset.x/carrouselScrollView.frame.width))==4{
                carrouselPageControl.currentPage = 0
                carrouselScrollView.setContentOffset(CGPointZero, animated: false)
            }
            else{
                carrouselPageControl.currentPage = Int(ceil(carrouselScrollView.contentOffset.x/carrouselScrollView.frame.width))
            }
        }
    }
    
  
    //MARK: - Social View Methods
    func loadSocialView(){
        socialContainer.layoutIfNeeded()

        socialContainer.alpha=1
        socialButtonsHidder.alpha=1
        socialButtonsHidder.hidden=false

        self.twiiterYConstrait.constant=0-view.frame.height
        self.facebookYConstrait.constant=0-view.frame.height
        self.instagramYConstrait.constant=0-view.frame.height
        self.linkedinYConstrait.constant=0-view.frame.height
        self.skypeYConstrait.constant=0-view.frame.height
        self.mailYConstrait.constant=0-view.frame.height
        self.websiteYConstrait.constant=0-view.frame.height
        self.socialButtonsHidderY.constant=0-view.frame.height
        
        self.twitterButton.layoutIfNeeded()
        self.facebookButton.layoutIfNeeded()
        self.instagramButton.layoutIfNeeded()
        self.linkedinButton.layoutIfNeeded()
        self.skypeButton.layoutIfNeeded()
        self.mailButton.layoutIfNeeded()
        self.websiteButton.layoutIfNeeded()
        self.socialButtonsHidder.layoutIfNeeded()
        
        socialContainer.hidden=false

        var viewWidthProportion = self.cousinView.frame.width/320
        UIView.animateWithDuration(0.4, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.twiiterYConstrait.constant=0
            self.facebookYConstrait.constant=0
            self.instagramYConstrait.constant=0
            self.linkedinYConstrait.constant=0
            self.skypeYConstrait.constant=0
            self.mailYConstrait.constant=0
            self.websiteYConstrait.constant=0
            self.socialButtonsHidderY.constant=0
            
            self.twitterButton.layoutIfNeeded()
            self.facebookButton.layoutIfNeeded()
            self.instagramButton.layoutIfNeeded()
            self.linkedinButton.layoutIfNeeded()
            self.skypeButton.layoutIfNeeded()
            self.mailButton.layoutIfNeeded()
            self.websiteButton.layoutIfNeeded()
            self.socialButtonsHidder.layoutIfNeeded()
            
        }) { (Bool) -> Void in
            
            UIView.animateWithDuration(0.8, delay: 0.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: nil, animations: { () -> Void in
                self.twiiterYConstrait.constant=100*viewWidthProportion
                self.twiiterXConstrait.constant=0*viewWidthProportion
                self.facebookXConstrait.constant=(0-77.7)*viewWidthProportion
                self.facebookYConstrait.constant=62.2*viewWidthProportion
                self.instagramXConstrait.constant=77.7*viewWidthProportion
                self.instagramYConstrait.constant=62.2*viewWidthProportion
                self.linkedinXConstrait.constant=96.7*viewWidthProportion
                self.linkedinYConstrait.constant=(0-22.2)*viewWidthProportion
                self.skypeXConstrait.constant=(0-96.7)*viewWidthProportion
                self.skypeYConstrait.constant=(0-22.2)*viewWidthProportion
                self.mailXConstrait.constant=(0-44.4)*viewWidthProportion
                self.mailYConstrait.constant=(0-88.8)*viewWidthProportion
                self.websiteXConstrait.constant=44.4*viewWidthProportion
                self.websiteYConstrait.constant=(0-88.8)*viewWidthProportion
                
                self.twitterButton.layoutIfNeeded()
                self.facebookButton.layoutIfNeeded()
                self.instagramButton.layoutIfNeeded()
                self.linkedinButton.layoutIfNeeded()
                self.skypeButton.layoutIfNeeded()
                self.mailButton.layoutIfNeeded()
                self.websiteButton.layoutIfNeeded()
                
                }) { (Bool) -> Void in
                    
                    UIView.animateWithDuration(0.3, delay: 0.2, options: nil, animations: { () -> Void in
                        self.socialButtonsHidder.alpha=0

                    }, completion: { (Bool) -> Void in
                        self.socialButtonsHidder.hidden=true
                        if self.pinchToDismissAlertShowed==false{
                            NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval((1/2)), target: self, selector: "showPromptForClosingCard", userInfo: nil, repeats: false)
                            
                            self.pinchToDismissAlertShowed=true
                        }
                    })
            }

            
        }
        
    }
    
    @IBAction func openTwitter(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://twitter.com/jchomali")!)
    }
    @IBAction func openFacebook(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://facebook.com/jchomali")!)
    }
    @IBAction func openInstagram(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://instagram.com/jchomali/")!)
    }
    @IBAction func openSkype(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://jchomali.com")!)
        
        var installed = UIApplication.sharedApplication().canOpenURL(NSURL(string: "skype:")!);
        if installed
        {
            UIApplication.sharedApplication().openURL(NSURL(string: "skype:juan.chomali?call")!)
        }
        else
        {
            UIApplication.sharedApplication().openURL(NSURL(string: "http://itunes.com/apps/skype/skype")!)
        }
    }
    @IBAction func openLinkedin(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://www.linkedin.com/in/jchomaliapps")!)
    }
    @IBAction func openMail(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "mailto://juan@jchomali.com")!)
    }
    @IBAction func openWebsite(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://jchomali.com")!)
    }
    
    
    //MARK: - Interests View Methods
    
    
    func loadInterestsView(){
        interestsContainer.layoutIfNeeded()
        interestsContainer.alpha=0
        self.interestsContainer.hidden=false
        
        self.interestMusicText.font=UIFont(name: self.interestMusicText.font.fontName, size: 16/320*self.view.frame.width)
        self.interestMusicImage.frame=CGRectMake(20, 25, 60, 60)
        self.interestMusicText.frame=CGRectMake(100, 20, cousinView.frame.width-120, 100/320*self.view.frame.width)
        self.interestMusicText.sizeToFit()
        
        self.interestPhotographyText.font=UIFont(name: self.interestMusicText.font.fontName, size: 16/320*self.view.frame.width)
        self.interestPhotographyImage.frame=CGRectMake(20, 165-interestsTextsPadding, 60, 60)
        self.interestPhotographyText.frame=CGRectMake(100, 160-interestsTextsPadding, cousinView.frame.width-120, 80/320*self.view.frame.width)
        self.interestPhotographyText.sizeToFit()
        
        self.interestSoccerText.font=UIFont(name: self.interestMusicText.font.fontName, size: 16/320*self.view.frame.width)
        self.interestSoccerImage.frame=CGRectMake(20, 285-interestsTextsPadding, 60, 60)
        self.interestSoccerText.frame=CGRectMake(100, 280-interestsTextsPadding, self.cousinView.frame.width-120, 80/320*self.view.frame.width)
        self.interestSoccerText.sizeToFit()

        self.interestTechText.font=UIFont(name: self.interestMusicText.font.fontName, size: 16/320*self.view.frame.width)
        self.interestTechImage.frame=CGRectMake(20, 410-interestsTextsPadding, 60, 60)
        self.interestTechText.frame=CGRectMake(100, 400-interestsTextsPadding, cousinView.frame.width-120, 100/320*self.view.frame.width)
        self.interestTechText.sizeToFit()
        
        
        
        UIView.animateWithDuration(0.4, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.interestsContainer.alpha=1
            }) { (Bool) -> Void in
                
                if self.pinchToDismissAlertShowed==false{
                    NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval((1/2)), target: self, selector: "showPromptForClosingCard", userInfo: nil, repeats: false)
                    
                    self.pinchToDismissAlertShowed=true
                }
        }

    }
    //MARK: - Projects Methods
    
    
    func loadProjectsView(){
        projectsTableView.layoutIfNeeded()
        projectsTableView.alpha=0
        self.projectsTableView.reloadData()
        self.projectsTableView.hidden=false
        
        
        UIView.animateWithDuration(0.4, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.projectsTableView.alpha=1
            }) { (Bool) -> Void in
                
                if self.pinchToDismissAlertShowed==false{
                    NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval((1/2)), target: self, selector: "showPromptForClosingCard", userInfo: nil, repeats: false)
                    
                    self.pinchToDismissAlertShowed=true
                }
        }

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectsTitles.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell : UITableViewCell! = (tableView.dequeueReusableCellWithIdentifier("appCell")as! UITableViewCell)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "appCell")
        }
        
        var titleLabel : UILabel! = (cell.viewWithTag(12) as! UILabel)
        var appIconImage : UIImageView! = (cell.viewWithTag(11) as! UIImageView)
        var descriptionLabel : UILabel! = (cell.viewWithTag(13) as! UILabel)
        var appLinkButton : UIButton! = (cell.viewWithTag(15) as! UIButton)

        
        titleLabel.text=projectsTitles.objectAtIndex(indexPath.row) as? String
        descriptionLabel.text=projectsDescriptions.objectAtIndex(indexPath.row) as? String
        appIconImage.image=UIImage(named: (projectsImages.objectAtIndex(indexPath.row) as! String))
        appIconImage.layer.masksToBounds=true
        appIconImage.layer.cornerRadius=0.225*appIconImage.frame.width
        appLinkButton.layer.masksToBounds=true
        appLinkButton.layer.cornerRadius=4
        appLinkButton.layer.borderWidth=1
        appLinkButton.layer.borderColor=appLinkButton.titleLabel?.textColor.CGColor
        
        return cell
    }
    
    @IBAction func downloadButtonPressed(sender: AnyObject) {
        
        var buttonPosition : CGPoint! = sender.convertPoint(CGPointZero, toView: projectsTableView)
        var indexPath = projectsTableView.indexPathForRowAtPoint(buttonPosition)
        if indexPath != nil{
            UIApplication.sharedApplication().openURL(NSURL(string: (projectsLinks.objectAtIndex(indexPath!.row)as! String))!)
        }
    }
    
    
}

