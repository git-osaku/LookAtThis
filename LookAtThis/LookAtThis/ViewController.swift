//
//  ViewController.swift
//  LookAtThis
//
//  Created by sakuda-ryo on 2015/05/14.
//  Copyright (c) 2015年 myname. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.userInteractionEnabled = true
        
        let rightGestrue = UISwipeGestureRecognizer(target: self, action: "rightSwipe:")
        rightGestrue.direction = UISwipeGestureRecognizerDirection.Right
        
        let leftGestrue = UISwipeGestureRecognizer(target: self, action: "leftSwipe:")
        leftGestrue.direction = UISwipeGestureRecognizerDirection.Left
        
        let upGestrue = UISwipeGestureRecognizer(target: self, action: "upSwipe:")
        upGestrue.direction = UISwipeGestureRecognizerDirection.Up
        
        let downGestrue = UISwipeGestureRecognizer(target: self, action: "downSwipe:")
        downGestrue.direction = UISwipeGestureRecognizerDirection.Down
        
        imageView.addGestureRecognizer(rightGestrue)
        imageView.addGestureRecognizer(leftGestrue)
        imageView.addGestureRecognizer(upGestrue)
        imageView.addGestureRecognizer(downGestrue)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rightSwipe(gestureRecognizer: UIGestureRecognizer){
        
        imageView.image = UIImage(named: "右.png")
    }
    
    func leftSwipe(gestureRecognizer: UIGestureRecognizer){
        
        
        imageView.image = UIImage(named: "左.jpg")
        
    }
    
    func upSwipe(gestureRecognizer: UIGestureRecognizer){
        

        imageView.image = UIImage(named: "上.png")
        
    }
    
    func downSwipe(gestureRecognizer: UIGestureRecognizer){
        
        
        imageView.image = UIImage(named: "下.png")
        
    }


}

