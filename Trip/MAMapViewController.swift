//
//  MAMapViewController.swift
//  Trip
//
//  Created by haojunhua on 15/4/13.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class MAMapViewController: UIViewController,MAMapViewDelegate {

    @IBOutlet var _mapView: MAMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var center=CLLocationCoordinate2D(latitude: 39.916,longitude: 116.397)
        _mapView.zoomLevel=12.5
        _mapView.showsCompass=false
        _mapView.showsScale=false
        _mapView.delegate = self
        
        for jq in DataSource().JQDatas {
            var annotation = MAPointAnnotation()
            annotation.coordinate = jq.location
            annotation.title="\(jq.id)"
            _mapView.addAnnotation(annotation)
        }
    }

    func mapView(mapView: MAMapView!, didSelectAnnotationView view: MAAnnotationView!) {
        println(view.annotation.title)
        mapView.deselectAnnotation(view.annotation, animated: false)
    }

    func mapView(mapView: MAMapView!, viewForAnnotation annotation: MAAnnotation!) -> MAAnnotationView! {
        let AnnotationViewID = "JQAnnotaionView";
        var annotationView:MAPPAnnotationView! = mapView.dequeueReusableAnnotationViewWithIdentifier(AnnotationViewID) as! MAPPAnnotationView!
        if (annotationView == nil) {
            var jq:JQ=DataSource().JQDatas[annotation.title!.toInt()!-1]
            annotationView = MAPPAnnotationView(annotation: annotation, reuseIdentifier: AnnotationViewID)
            annotationView.setThumb(jq.picPath)
        }
        return annotationView
    }

}
