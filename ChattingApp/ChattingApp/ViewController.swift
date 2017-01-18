//
//  scr2Controller.swift
//  ChattingApp
//
//  Created by ༼☠͙ JåćK ✩ Ħᴓᴓ ☠͙༽ on 1/10/17.
//  Copyright © 2017 ༼☠͙ JåćK ✩ Ħᴓᴓ ☠͙༽. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    var currentIndex = 0
    var customView:UIImageView!
    var timer:Timer!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var rightConstaint: NSLayoutConstraint!
    @IBOutlet weak var viewMenu: UIView!
    
    @IBOutlet weak var imgLogo2: UIImageView!
    @IBOutlet weak var imgLogo: UIImageView!
    
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBackground.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        viewBackground.layer.cornerRadius = 10
        btnSubmit.layer.borderColor = UIColor.blue.cgColor
        btnSubmit.layer.borderWidth = 2
        btnSubmit.layer.cornerRadius = 7
        
        let path = Bundle.main.path(forResource: "Intro background star", ofType: "mp4")
        player = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
        player!.actionAtItemEnd = AVPlayerActionAtItemEnd.none;
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: kCMTimeZero)
        player!.play()
    }
    
    @IBAction func btn_Login(_ sender: Any) {
        if rightConstaint.constant == 0
        {
            self.rightConstaint.constant = viewMenu.frame.width + 32
            UIView.animate(withDuration: 1, delay: 0.0,
                           usingSpringWithDamping: 0.25,
                           initialSpringVelocity: 0.0,
                           options: [], animations: {
                            self.view.layoutIfNeeded()
            })
        }
        else
        {
            self.rightConstaint.constant = 0
            UIView.animate(withDuration: 0, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    //    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
    //        if rightConstaint.constant != 0
    //        {
    //            rightConstaint.constant = 0
    //            UIView.animate(withDuration: 0, animations: {
    //                self.view.layoutIfNeeded()
    //            })
    //        }
    //    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.view.layer.transform = CATransform3DMakeScale(0, 0, 1)
        self.txtUsername.layer.transform = CATransform3DMakeScale(0, 0, 1)
        self.txtEmail.layer.transform = CATransform3DMakeScale(0, 0, 1)
        self.txtPassword.layer.transform = CATransform3DMakeScale(0, 0, 1)
        self.btnSubmit.layer.transform = CATransform3DMakeScale(0, 0, 1)
        self.btnLogin.layer.transform = CATransform3DMakeScale(0, 0, 1)
        
        UIView.animate(withDuration: 0.5, animations:
            {
                self.view.layer.transform = CATransform3DMakeScale(1, 1, 1)
        })
    }
    override func viewDidAppear(_ animated: Bool)
    {
        self.txtUsername.layer.transform = CATransform3DMakeScale(1, 1, 1)
        self.txtEmail.layer.transform = CATransform3DMakeScale(1, 1, 1)
        self.txtPassword.layer.transform = CATransform3DMakeScale(1, 1, 1)
        self.btnSubmit.layer.transform = CATransform3DMakeScale(1, 1, 1)
        self.btnLogin.layer.transform = CATransform3DMakeScale(1, 1, 1)
        
        txtUsername.center.x -= self.view.bounds.width + txtUsername.layer.frame.width
        txtEmail.center.x -= self.view.bounds.width + txtEmail.layer.frame.width
        txtPassword.center.x -= self.view.bounds.width + txtPassword.layer.frame.width
        btnSubmit.center.x -= self.view.bounds.width + btnSubmit.layer.frame.width
        btnLogin.center.x -= self.view.bounds.width + btnLogin.layer.frame.width
        
        UIView.animate(withDuration: 0.08, delay: 0, options: [.curveEaseInOut], animations:
            {
                self.txtUsername.center.x += self.view.bounds.width + self.txtUsername.layer.frame.width + 50
        }, completion:
            { (true) in
                UIView.animate(withDuration: 0.5, delay: 0.0,
                               usingSpringWithDamping: 0.25,
                               initialSpringVelocity: 0.0,
                               options: [], animations:
                    {
                        self.txtUsername.center.x -= 50
                        
                }, completion: { (true) in
                    
                    UIView.animate(withDuration: 0.08, delay: 0, options: [.curveEaseInOut], animations:
                        {
                            self.txtEmail.center.x += self.view.bounds.width + self.txtEmail.layer.frame.width + 50
                    }, completion:
                        { (true) in
                            UIView.animate(withDuration: 0.5, delay: 0.0,
                                           usingSpringWithDamping: 0.25,
                                           initialSpringVelocity: 0.0,
                                           options: [], animations:
                                {
                                    self.txtEmail.center.x -= 50
                            }, completion:
                                { (true) in
                                    UIView.animate(withDuration: 0.08, delay: 0, options: [.curveEaseInOut], animations:
                                        {
                                            self.txtPassword.center.x += self.view.bounds.width + self.txtPassword.layer.frame.width + 50
                                    }, completion:
                                        { (true) in
                                            UIView.animate(withDuration: 0.5, delay: 0.0,
                                                           usingSpringWithDamping: 0.25,
                                                           initialSpringVelocity: 0.0,
                                                           options: [], animations:
                                                {
                                                    self.txtPassword.center.x -= 50
                                            }, completion:
                                                { (true) in
                                                    UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations:
                                                        {
                                                            self.btnSubmit.center.x += self.view.bounds.width + self.btnSubmit.layer.frame.width + 50
                                                            
                                                    }, completion:
                                                        { (true) in
                                                            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseInOut], animations:
                                                                {
                                                                    self.btnSubmit.center.x -= 50
                                                                    
                                                            }, completion:
                                                                { (true) in
                                                                    UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations:
                                                                        {
                                                                            self.btnLogin.center.x += self.view.bounds.width + self.btnSubmit.layer.frame.width + 50
                                                                    }, completion:
                                                                        { (true) in
                                                                            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseInOut], animations:
                                                                                {
                                                                                    
                                                                                    self.btnLogin.center.x -= 50
                                                                                    
                                                                            }, completion:
                                                                                { (true) in
                                                                                    UIView.transition(with: self.imgLogo, duration: 0.8, options: [UIViewAnimationOptions.transitionFlipFromBottom, .autoreverse], animations: {
                                                                                        
                                                                                        UIView.setAnimationRepeatCount(.infinity)
                                                                                        
                                                                                        UIView.transition(with: self.imgLogo2, duration: 0.8, options: [UIViewAnimationOptions.transitionFlipFromBottom, .autoreverse], animations: {
                                                                                            
                                                                                            UIView.setAnimationRepeatCount(.infinity)
                                                                                            
                                                                                            
                                                                                        }) {(true) in
                                                                                            
                                                                                        }
                                                                                        
                                                                                    })
                                                                            })
                                                                    })
                                                            })
                                                    })
                                            })
                                    })
                            })
                    })
                })
        })
    }
    
    func playerItemDidReachEnd() {
        player!.seek(to: kCMTimeZero)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

extension UIViewController {
    
    class ViewController2: UIViewController {
        
    }
}

