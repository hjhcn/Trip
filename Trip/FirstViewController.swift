//
//  FirstViewController.swift
//  Trip
//
//  Created by haojunhua on 15/3/24.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,BMKMapViewDelegate,BMKLocationServiceDelegate{
    
    @IBOutlet weak var _mapView: BMKMapView!
    var _locService:BMKLocationService!
    var pointAnnotation:BMKPointAnnotation!
    
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
        
        let coor=CLLocationCoordinate2D(latitude: 39.915,longitude: 116.404)
        
        pointAnnotation = BMKPointAnnotation()
        pointAnnotation.coordinate = coor
        //        pointAnnotation.title="1"
        _mapView.addAnnotation(pointAnnotation)
        
        
//        var ground = BMKGroundOverlay(position: coor, zoomLevel: 11, anchor:CGPointMake(0.0,0.0), icon: UIImage(named: "fzm.jpg"))
//        ground.alpha = 0.8;
//        _mapView.addOverlay(ground)
//        
//        var circle = BMKCircle(centerCoordinate: coor, radius: 1000)
//        _mapView.addOverlay(circle)
        
//        var coords=[
//            CLLocationCoordinate2D(latitude: 39.965, longitude: 116.604),
//            CLLocationCoordinate2D(latitude: 39.865, longitude: 116.604),
//            CLLocationCoordinate2D(latitude: 39.865, longitude: 116.704),
//            CLLocationCoordinate2D(latitude: 39.905, longitude: 116.654),
//            CLLocationCoordinate2D(latitude: 39.965, longitude: 116.704)
//        ]
//        var arrayPtr:UnsafeMutablePointer = UnsafeMutableBufferPointer<CLLocationCoordinate2D>(start: &coords, count: coords.count).baseAddress as UnsafeMutablePointer<CLLocationCoordinate2D>
//        var polygon:BMKPolygon = BMKPolygon(coordinates: arrayPtr, count: 5)
//        _mapView.addOverlay(polygon)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        _mapView.zoomLevel=16
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapViewDidFinishLoading(mapView:BMKMapView){
        
    }
    
    func mapView(mapView: BMKMapView!, regionWillChangeAnimated animated: Bool) {
        println("选择regionWillChangeAnimated")
        
    }
    
    func mapView(mapView: BMKMapView!, regionDidChangeAnimated animated: Bool) {
        println("选择regionDidChangeAnimated")
    }
    
    func mapView(mapView: BMKMapView!, onDrawMapFrame status: BMKMapStatus!) {
//        println("选择onDrawMapFrame")
    }
    
    func mapView(mapView: BMKMapView!, onClickedMapBlank coordinate: CLLocationCoordinate2D) {
        println("选择onClickedMapBlank")
        
        println("\(coordinate.latitude)x\(coordinate.longitude)")
    }
    
    func mapview(mapView: BMKMapView!, onDoubleClick coordinate: CLLocationCoordinate2D) {
        
    }
    
    func mapView(mapView: BMKMapView!, didSelectAnnotationView view: BMKAnnotationView!) {
        println("选择annotation")
    }
    
    func mapView(mapView: BMKMapView!, didDeselectAnnotationView view: BMKAnnotationView!) {
    }
    
    func mapView(mapView: BMKMapView!, annotationViewForBubble view: BMKAnnotationView!) {
        println(view.annotation.title!())
        self.performSegueWithIdentifier("testSegue", sender: self)
    }
    
    func mapView(mapView: BMKMapView!, viewForAnnotation annotation: BMKAnnotation!) -> BMKAnnotationView! {
        let AnnotationViewID = "renameMark";
        var annotationView:BMKPinAnnotationView! = mapView.dequeueReusableAnnotationViewWithIdentifier(AnnotationViewID) as BMKPinAnnotationView!
        if annotationView == nil {
            annotationView = BMKPinAnnotationView(annotation: annotation, reuseIdentifier: AnnotationViewID)
            annotationView.canShowCallout=false
        }
        
        annotationView.image=nil
//        annotationView.centerOffset=CGPointMake(-25, -50)
        var overlay:OverlayView = NSBundle.mainBundle().loadNibNamed("Overlay", owner: self, options: nil)[0] as OverlayView
        overlay.image.image=UIImage(named: "gg.jpg")
        overlay.label.text="故宫"
        overlay.frame=CGRectMake(0, 6, 100, 140)
        
        
        var paopaoView=PaopaoView(frame: CGRectMake(-50, -160, 100, 160))
        paopaoView.backgroundColor=UIColor.clearColor()
        paopaoView.addSubview(overlay)
        annotationView.addSubview(paopaoView)
//        annotationView.paopaoView=BMKActionPaopaoView(customView: overlay)
        
        var tap:UITapGestureRecognizer=UITapGestureRecognizer(target: self, action:"paoClick:")
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        paopaoView.userInteractionEnabled=true
        paopaoView.addGestureRecognizer(tap)
        
        return annotationView
    }
    
    func mapView(mapView: BMKMapView!, viewForOverlay overlay: BMKOverlay!) -> BMKOverlayView! {
        if(overlay.isKindOfClass(BMKCircle)){
            var circleView = BMKCircleView(overlay: overlay)
            circleView.fillColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
            circleView.strokeColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.5)
            circleView.lineWidth = 1.0
            return circleView
        }
        if (overlay.isKindOfClass(BMKGroundOverlay))
        {
            var groundView = BMKGroundOverlayView(overlay: overlay)
            return groundView;
        }
        
        if (overlay.isKindOfClass(BMKPolygon))
        {
            var polygonView=BMKPolygonView(overlay: overlay)
            polygonView.loadStrokeTextureImage(UIImage(named: "fzm.jpg"))
            polygonView.lineWidth = 2.0
            return polygonView;
        }
        
        return nil
    }
    
    @IBAction func backToFaxian(segue:UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func paoClick(sender:UITapGestureRecognizer){
        print("paoClickpaoClickpaoClickpaoClickpaoClickpaoClick")
    }
}

