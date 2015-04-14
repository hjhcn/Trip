//
//  FindViewController.swift
//  Trip
//
//  Created by haojunhua on 15/3/24.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit
import MapKit

class FindViewController: UIViewController,MKMapViewDelegate{
    
    @IBOutlet weak var _mapView: MKMapView!
    var _jqId:Int=0
    var _jq:JQ?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        _mapView.delegate = self
        //        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        _mapView.delegate = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var center=CLLocationCoordinate2D(latitude: 39.916,longitude: 116.397)
        _mapView.region=MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.1))
        
        for jq in DataSource().JQDatas {
            var annotation = MKPointAnnotation()
            annotation.coordinate = jq.location
            annotation.title="\(jq.id)"
            _mapView.addAnnotation(annotation)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func mapView(mapView: MKMapView!, regionDidChangeAnimated animated: Bool) {

    }
    
    
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
        println(NSDate().timeIntervalSince1970)
        _jqId=view.annotation.title!.toInt()!
        _jq=DataSource().JQDatas[view.annotation.title!.toInt()!-1]
        self.performSegueWithIdentifier("findToJQ", sender: self)
        mapView.deselectAnnotation(view.annotation, animated: false)
        println(NSDate().timeIntervalSince1970)
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        let AnnotationViewID = "JQAnnotaionView";
        var annotationView:PPAnnotationView! = mapView.dequeueReusableAnnotationViewWithIdentifier(AnnotationViewID) as! PPAnnotationView!
        if (annotationView == nil) {
            annotationView = PPAnnotationView(annotation: annotation, reuseIdentifier: AnnotationViewID)
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
        jqViewController._id = _jqId
        jqViewController._jq=_jq
    }
}

