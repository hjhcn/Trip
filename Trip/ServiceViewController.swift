//
//  ServiceViewController.swift
//  Trip
//
//  Created by haojunhua on 15/4/13.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit
import MapKit

class ServiceViewController: UIViewController,MKMapViewDelegate {
    
    var _fw:FW?

    @IBOutlet weak var _mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _mapView.delegate=self
        var center=CLLocationCoordinate2D(latitude: 39.916,longitude: 116.397)
        _mapView.region=MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015))
        for fw in DataSource().FWDatas {
            var annotation = MKPointAnnotation()
            annotation.coordinate = fw.location
            annotation.title="\(fw.id)"
            _mapView.addAnnotation(annotation)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
        println(NSDate().timeIntervalSince1970)
        _fw=DataSource().FWDatas[view.annotation.title!.toInt()!-1]
        self.performSegueWithIdentifier("serviceToFW", sender: self)
        mapView.deselectAnnotation(view.annotation, animated: false)
        println(NSDate().timeIntervalSince1970)
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        let AnnotationViewID = "JDAnnotaionView";
        var annotationView:PPAnnotationView! = mapView.dequeueReusableAnnotationViewWithIdentifier(AnnotationViewID) as! PPAnnotationView!
        if annotationView == nil {
            annotationView = PPAnnotationView(annotation: annotation, reuseIdentifier: AnnotationViewID)
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
