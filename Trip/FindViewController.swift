//
//  FindViewController.swift
//  Trip
//
//  Created by haojunhua on 15/3/24.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class FindViewController: UIViewController,MAMapViewDelegate{
    
    @IBOutlet weak var _mapView: MAMapView!
    var _jqId:Int=0
    var _jq:JQ?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _mapView.centerCoordinate=CLLocationCoordinate2D(latitude: 39.90618095,longitude: 116.40546799)
        _mapView.zoomLevel=13
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
    
    override func viewWillDisappear(animated: Bool) {
        println("viewWillDisappear\(NSDate().timeIntervalSince1970)")
    }
    
    override func viewDidDisappear(animated: Bool) {
        println("viewDidDisappear\(NSDate().timeIntervalSince1970)")
    }
    
    func mapView(mapView: MAMapView!, regionDidChangeAnimated animated: Bool) {

    }
    
    
    func mapView(mapView: MAMapView!, didSelectAnnotationView view: MAAnnotationView!) {
        println(NSDate().timeIntervalSince1970)
        _jqId=view.annotation.title!.toInt()!
        _jq=DataSource().JQDatas[view.annotation.title!.toInt()!-1]
        self.performSegueWithIdentifier("findToJQ", sender: self)
        mapView.deselectAnnotation(view.annotation, animated: false)
        println(NSDate().timeIntervalSince1970)
    }
    
    func mapView(mapView: MAMapView!, viewForAnnotation annotation: MAAnnotation!) -> MAAnnotationView! {
        let AnnotationViewID = "JQAnnotaionView";
        var annotationView:MAPPAnnotationView! = mapView.dequeueReusableAnnotationViewWithIdentifier(AnnotationViewID) as! MAPPAnnotationView!
        if (annotationView == nil) {
            annotationView = MAPPAnnotationView(annotation: annotation, reuseIdentifier: AnnotationViewID)
            var jq:JQ=DataSource().JQDatas[annotation.title!.toInt()!-1]
            annotationView.setThumb(jq.picPath)
        }
        return annotationView
    }
    
    @IBAction func backToFind(segue:UIStoryboardSegue!) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var jqViewController:JQViewController = segue.destinationViewController as! JQViewController;
        jqViewController._jq=_jq
    }
}

