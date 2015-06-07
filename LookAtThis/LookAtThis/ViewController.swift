//
//  ViewController.swift
//  LookAtThis
//
//  Created by sakuda-ryo on 2015/05/14.
//  Copyright (c) 2015年 myname. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var score :Int = 0{
        didSet{
            
            scoreLabel.text = "\(score)" + "点"
            
        }
    }
    
    //array of entries
    var entries = NSArray()
    let newsUrlString = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.itmedia.co.jp/rss/2.0/news_bursts.xml&num=8"
    
    
    
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
        
        let tapGestrue = UITapGestureRecognizer(target: self, action: "tap:")
        
        imageView.addGestureRecognizer(rightGestrue)
        imageView.addGestureRecognizer(leftGestrue)
        imageView.addGestureRecognizer(upGestrue)
        imageView.addGestureRecognizer(downGestrue)
        imageView.addGestureRecognizer(tapGestrue)
   
    
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
    
    func tap(gestureRecognizer: UIGestureRecognizer){
        
         imageView.image = UIImage(named: "前.jpg")
    }
    
    
    func randomDog(direction :Int) {
        
        let randInt = arc4random_uniform(4);
        
        //NSLog("\(randInt)")
        
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
            // 識別ID取得
            var identificationId = UIDevice.currentDevice().identifierForVendor.UUIDString
            
            // rankingAPI接続
            var httpRequest = HttpRequestController()
            var result: () = httpRequest.postData(identificationId, score: score)
            
            if(result === "rankin") {
                scoreLabel.text = "RANK IN!!!"
            }
            println(result)
            score = 0
        }
        
    }
    

}
