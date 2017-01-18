//
//  launchscrController.swift
//  ChattingApp
//
//  Created by ༼☠͙ JåćK ✩ Ħᴓᴓ ☠͙༽ on 1/10/17.
//  Copyright © 2017 ༼☠͙ JåćK ✩ Ħᴓᴓ ☠͙༽. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController {
    @IBOutlet weak var imgYellow: UIImageView!
    @IBOutlet weak var imgBlack: UIImageView!
    @IBOutlet weak var constraintTopBlack: NSLayoutConstraint!
    @IBOutlet weak var constraintBottomYellow: NSLayoutConstraint!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var imgFlybi: UIImageView!
    
    var h_View: CGFloat!
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        h_View = view.frame.height
        imgLogo.layer.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
        //  imgFlybi.layer.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
        constraintBottomYellow.constant = h_View
        constraintTopBlack.constant = h_View
        view.layoutSubviews()
        animationBackground()
        
    }
}

extension LaunchScreenController {
    func animationBackground() {
        constraintBottomYellow.constant = h_View / 2 - 80
        constraintTopBlack.constant = h_View / 2 - 80
        UIView.animate(withDuration: 2.0, delay: 0.0,
                       usingSpringWithDamping: 0.25,
                       initialSpringVelocity: 0.0,
                       options: [], animations: {
                        //self.imgFlybi.layer.transform = CATransform3DMakeScale(1, 1, 1)
                        self.imgFlybi.layer.position.x += 200.0
                        self.imgFlybi.layer.cornerRadius = 50.0
                        self.imgFlybi.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.0)
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.view.layoutSubviews()
        }) { (true) in
            self.constraintTopBlack.constant = -160
            UIView.animate(withDuration: 2.0, delay: 0.0,
                           usingSpringWithDamping: 0.25,
                           initialSpringVelocity: 0.0,
                           options: [], animations: {
                            self.imgLogo.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
            }, completion: { (true) in
                
            })
            UIView.animate(withDuration: 0.6, delay: 1, options: UIViewAnimationOptions.curveLinear, animations: {
                self.view.layoutSubviews()
            }, completion: { (true) in
                UIView.animate(withDuration: 1, delay: 3, options: UIViewAnimationOptions.curveLinear, animations: {
                    
                }, completion: { (true) in
                    let src = self.storyboard?.instantiateViewController(withIdentifier: "MH2")
                    var dem:Int = 0
                    self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
                        dem += 1
                        if dem == 2 {
                            self.timer.invalidate()
                            self.timer = nil
                            self.present(src!, animated: true, completion: nil)
                        }
                    })
                    
                    
                })
            })
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
