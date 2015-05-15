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

    @IBOutlet weak var scoreLabel: UILabel!
    
    var score :Int = 0{
        didSet{
            
            scoreLabel.text = "\(score)" + "点"
            
        }
    }
    
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
        
        self.randomDog(0)
        
        
        
    }
    
    func leftSwipe(gestureRecognizer: UIGestureRecognizer){
        
        self.randomDog(1)
        
    }
    
    func upSwipe(gestureRecognizer: UIGestureRecognizer){
        

        self.randomDog(2)
        
        
    }
    
    func downSwipe(gestureRecognizer: UIGestureRecognizer){
        
        
        self.randomDog(3)
        
    }
    
    func randomDog(direction :Int) {
        
        let randInt = arc4random_uniform(4);
        
        NSLog("\(randInt)")
        
        if randInt == 0 {
            
            imageView.image = UIImage(named: "右.jpg")
            
        } else if randInt == 1 {
            
            imageView.image = UIImage(named: "左.jpg")
            
        } else if randInt == 2 {
            
            imageView.image = UIImage(named: "上.jpg")
            
        } else if randInt == 3 {
            
            imageView.image = UIImage(named: "下.jpg")
            
        }
        
        if Int(randInt) == direction {
            
            
            score++
            
        } else {
            
            
            score = 0
        }
        
        
    }


}

