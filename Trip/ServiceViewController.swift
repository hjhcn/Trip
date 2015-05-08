//
//  ServiceViewController.swift
//  Trip
//
//  Created by haojunhua on 15/4/13.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController,MAMapViewDelegate {
    
    var _fw:FW?

    @IBOutlet weak var _mapView: MAMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _mapView.centerCoordinate=CLLocationCoordinate2D(latitude: 39.91608921,longitude: 116.39705658)
        _mapView.zoomLevel=15.2
        _mapView.delegate = self
        
        for fw in DataSource().FWDatas {
            var annotation = MAPointAnnotation()
            annotation.coordinate = fw.location
            annotation.title="\(fw.id)"
            _mapView.addAnnotation(annotation)
        }
    }

    func mapView(mapView: MAMapView!, didSelectAnnotationView view: MAAnnotationView!) {
        println(NSDate().timeIntervalSince1970)
        _fw=DataSource().FWDatas[view.annotation.title!.toInt()!-1]
        self.performSegueWithIdentifier("serviceToFW", sender: self)
        mapView.deselectAnnotation(view.annotation, animated: false)
        println(NSDate().timeIntervalSince1970)
    }
    
    func mapView(mapView: MAMapView!, viewForAnnotation annotation: MAAnnotation!) -> MAAnnotationView! {
        let AnnotationViewID = "JDAnnotaionView";
        var annotationView:MAPPAnnotationView! = mapView.dequeueReusableAnnotationViewWithIdentifier(AnnotationViewID) as! MAPPAnnotationView!
        if annotationView == nil {
            annotationView = MAPPAnnotationView(annotation: annotation, reuseIdentifier: AnnotationViewID)
            var fw:FW=DataSource().FWDatas[annotation.title!.toInt()!-1]
            annotationView.setThumb(fw.picPath)
        }
        return annotationView
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var fwViewController:FWViewController = segue.destinationViewController as! FWViewController;
        fwViewController._fw = _fw
    }
    

}
