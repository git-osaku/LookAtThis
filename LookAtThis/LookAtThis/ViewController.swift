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
        
        self.getData()
        
        //
        println(UIDevice.currentDevice().identifierForVendor.UUIDString)
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
    
    func getData() {
        
        // create the url-request
        let urlString = "http://192.168.33.10:8000/ranking"
        var request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        
        // set the method(HTTP-POST)
        request.HTTPMethod = "POST"
        // set the header(s)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // set the request-body(JSON)
        var params: [String: AnyObject] = [
            "foo": "bar",
            "baz": [
                "a": 1,
                "b": 20,
                "c": 300
            ]
        ]
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: nil)
        
        // use NSURLSessionDataTask
        var task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {data, response, error in
            if (error == nil) {
                var result = NSString(data: data, encoding: NSUTF8StringEncoding)!

                println(result)
            } else {
                println(error)
                            }
        })
        task.resume()
        
    }
}
