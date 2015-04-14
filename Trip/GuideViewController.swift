//
//  GuideViewController.swift
//  Trip
//
//  Created by haojunhua on 15/3/30.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit
import MapKit

class GuideViewController: UIViewController,MKMapViewDelegate, UICollectionViewDelegate, UIScrollViewDelegate, NSObjectProtocol, UICollectionViewDataSource{
    
    @IBOutlet weak var _mapView: MKMapView!
    
    @IBOutlet weak var _collectionView: UICollectionView!
    
    var _isMapMode:Bool=true
    var _jd:JD?
    
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
        _mapView.region=MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015))
        for jd in DataSource().JDDatas {
            var annotation = MKPointAnnotation()
            annotation.coordinate = jd.location
            annotation.title="\(jd.id)"
            _mapView.addAnnotation(annotation)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
        println(NSDate().timeIntervalSince1970)
        _jd=DataSource().JDDatas[view.annotation.title!.toInt()!-1]
        self.performSegueWithIdentifier("guideToJD", sender: self)
        mapView.deselectAnnotation(view.annotation, animated: false)
        println(NSDate().timeIntervalSince1970)
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        let AnnotationViewID = "JDAnnotaionView";
        var annotationView:PPAnnotationView! = mapView.dequeueReusableAnnotationViewWithIdentifier(AnnotationViewID) as! PPAnnotationView!
        if annotationView == nil {
            annotationView = PPAnnotationView(annotation: annotation, reuseIdentifier: AnnotationViewID)
            var jd:JD=DataSource().JDDatas[annotation.title!.toInt()!-1]
            annotationView.setThumb(jd.picPath)
        }
        return annotationView
    }
    
    @IBAction func changeShowMode(sender: UIBarButtonItem) {
        _isMapMode = !_isMapMode
        var fromView:UIView = self._isMapMode ? _collectionView : _mapView
        var toView:UIView = self._isMapMode ? _mapView :_collectionView
        
        if !_isMapMode {
            _collectionView.hidden=false
            UIView.transitionWithView(_collectionView, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {}, completion: {
                finished in
                if finished {
                    sender.title = "列表"
                }
            })
        }else {
            _collectionView.hidden=true
//            UIView.transitionWithView(_mapView, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {}, completion: {
//                finished in
//                if finished {
//                    sender.title = "地图"
//                }
//            })
            sender.title = "地图"
        }
        
        
//        UIView.transitionFromView(fromView, toView: toView, duration: 0.5, options: transitionDirection, completion: {
//           finished in
//            if finished {
//                sender.title = self._isMapMode ? "列表" : "地图"
//            }
//        })
        
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return DataSource().JDDatas.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! JDCollectionCell
        var jd:JD=DataSource().JDDatas[indexPath.row]
        cell.nameLabel.text=jd.name
        cell._view.layer.masksToBounds=true
        cell._view.layer.cornerRadius=10.0
        cell._image.image=UIImage(named: jd.picPath)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var jdViewController:JDViewController = segue.destinationViewController as! JDViewController;
        if _jd == nil {
            _jd = DataSource().JDDatas[_collectionView.indexPathsForSelectedItems()[0].row]
        }
        jdViewController._jd = _jd
    }
    
    

}
