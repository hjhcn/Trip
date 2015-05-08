//
//  PositionViewController.swift
//  Trip
//
//  Created by haojunhua on 15/4/10.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController,MAMapViewDelegate{

    @IBOutlet var _mapView: MAMapView!
    
    var _location:CLLocationCoordinate2D!
    
    override func viewWillAppear(animated: Bool) {
        _mapView.centerCoordinate=_location
        _mapView.zoomLevel=13
        
        var annotation = MAPointAnnotation()
        annotation.coordinate = _location
        _mapView.addAnnotation(annotation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func mapView(mapView: MAMapView!, viewForAnnotation annotation: MAAnnotation!) -> MAAnnotationView! {
        let AnnotationViewID = "JDAnnotaionView";
        var annotationView:MAPinAnnotationView! = mapView.dequeueReusableAnnotationViewWithIdentifier(AnnotationViewID) as! MAPinAnnotationView!
        if annotationView == nil {
            annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: AnnotationViewID)
            annotationView.animatesDrop = true
        }
        return annotationView
    }

}
