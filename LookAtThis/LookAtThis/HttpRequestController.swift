//
//  HttpRequestController.swift
//  LookAtThis
//
//  Created by Mafuyu Kamono on 2015/06/04.
//  Copyright (c) 2015年 myname. All rights reserved.
//

import Foundation

class HttpRequestController {
    func postData(userId :String, score :Int) -> NSString {
    
        // create the url-request
        let urlString = "http://192.168.33.10:8000/ranking"
        var request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
    
        // set the method(HTTP-POST)
        request.HTTPMethod = "POST"
        
        // set the header(s)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        // set the request-body(JSON)
        var params: [String: AnyObject] = ["user_id":userId,"point":score]
    
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: nil)
    
        // use NSURLSessionDataTask
        var task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {data, response, error in
            if (error == nil) {
                var result = NSString(data: data, encoding: NSUTF8StringEncoding)!
                
                return result
            } else {
                return error
            }
        })
        task.resume()    
    }
    
    func getData() {
        
        // create the url-request
        let urlString = "http://192.168.33.10:8000/ranking"
        var request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        
        // set the method(HTTP-GET)
        request.HTTPMethod = "GET"
        
        // set the header(s)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // set the request-body(JSON)
        var params: [String: AnyObject] = ["total": 0]
        
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