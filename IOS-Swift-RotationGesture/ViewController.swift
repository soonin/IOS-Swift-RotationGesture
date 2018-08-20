//
//  ViewController.swift
//  IOS-Swift-RotationGesture
//
//  Created by Pooya on 2018-08-20.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewRotate: UIImageView!
    var rotateGesture  = UIRotationGestureRecognizer()
    var lastRotation   = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ROTATE Gesture
        rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.rotatedView(_:)))
        viewRotate.addGestureRecognizer(rotateGesture)
        viewRotate.isUserInteractionEnabled = true
        viewRotate.isMultipleTouchEnabled = true
    }

    @objc func rotatedView(_ sender : UIRotationGestureRecognizer){
        var lastRotation = CGFloat()
        self.view.bringSubview(toFront: viewRotate)
        if(sender.state == UIGestureRecognizerState.ended){
            lastRotation = 0.0;
        }
        let rotation = 0.0 - (lastRotation - sender.rotation)
        // var point = rotateGesture.location(in: viewRotate)
        let currentTrans = sender.view?.transform
        let newTrans = currentTrans!.rotated(by: rotation)
        sender.view?.transform = newTrans
        lastRotation = sender.rotation
    }

}

