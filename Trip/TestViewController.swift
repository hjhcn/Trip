//
//  TestViewController.swift
//  Trip
//
//  Created by haojunhua on 15/4/14.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool) {
        println("viewWillDisappear\(NSDate().timeIntervalSince1970)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var jqViewController:JQViewController = segue.destinationViewController as! JQViewController;
        jqViewController._jq=DataSource().JQDatas[0]
    }

}
