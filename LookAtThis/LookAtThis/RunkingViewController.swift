//
//  RunkingViewController.swift
//  LookAtThis
//
//  Created by sakuda-ryo on 2015/08/03.
//  Copyright (c) 2015年 myname. All rights reserved.
//

import UIKit

class RunkingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tabeView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabeView.delegate = self
        self.tabeView.dataSource = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        return cell
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
