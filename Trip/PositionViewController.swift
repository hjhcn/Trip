//
//  PositionViewController.swift
//  Trip
//
//  Created by haojunhua on 15/4/10.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit
import MapKit

class PositionViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet var _mapView: MKMapView!
    
    override func viewWillAppear(animated: Bool) {
        _mapView.delegate = self
        _mapView.centerCoordinate=CLLocationCoordinate2D(latitude: 39.920,longitude: 116.404)
        //        self.navigationController?.navigationBarHidden = true
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        _mapView.delegate = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
