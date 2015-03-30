//
//  GuideViewController.swift
//  Trip
//
//  Created by haojunhua on 15/3/30.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController,BMKMapViewDelegate,BMKLocationServiceDelegate{
    
    @IBOutlet weak var _mapView: BMKMapView!
    var _locService:BMKLocationService!
    
    override func viewWillAppear(animated: Bool) {
        _locService=BMKLocationService()
        _mapView.viewWillAppear()
        _mapView.delegate = self
        _locService.delegate = self
        //        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        _mapView.viewWillDisappear()
        _mapView.delegate = nil
        _locService.delegate = nil
    }
    
    override func viewDidAppear(animated: Bool) {
        
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        _mapView.zoomLevel=17
        _mapView.centerCoordinate=CLLocationCoordinate2D(latitude: 39.921,longitude: 116.404)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapViewDidFinishLoading(mapView:BMKMapView){
        
    }

    
}
