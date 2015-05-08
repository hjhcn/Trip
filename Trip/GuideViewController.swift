//
//  GuideViewController.swift
//  Trip
//
//  Created by haojunhua on 15/3/30.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController,MAMapViewDelegate, UICollectionViewDelegate, UIScrollViewDelegate, NSObjectProtocol, UICollectionViewDataSource{
    
    @IBOutlet weak var _mapView: MAMapView!
    
    @IBOutlet weak var _collectionView: UICollectionView!
    
    var _isMapMode:Bool=true
    var _jd:JD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _mapView.centerCoordinate=CLLocationCoordinate2D(latitude: 39.91608921,longitude: 116.39705658)
        _mapView.zoomLevel=15.2
        _mapView.delegate = self
        
        for jd in DataSource().JDDatas {
            var annotation = MAPointAnnotation()
            annotation.coordinate = jd.location
            annotation.title="\(jd.id)"
            _mapView.addAnnotation(annotation)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MAMapView!, didSelectAnnotationView view: MAAnnotationView!) {
        println(NSDate().timeIntervalSince1970)
        _jd=DataSource().JDDatas[view.annotation.title!.toInt()!-1]
        self.performSegueWithIdentifier("guideToJD", sender: self)
        mapView.deselectAnnotation(view.annotation, animated: false)
        println(NSDate().timeIntervalSince1970)
    }
    
    func mapView(mapView: MAMapView!, viewForAnnotation annotation: MAAnnotation!) -> MAAnnotationView! {
        let AnnotationViewID = "JDAnnotaionView";
        var annotationView:MAPPAnnotationView! = mapView.dequeueReusableAnnotationViewWithIdentifier(AnnotationViewID) as! MAPPAnnotationView!
        if annotationView == nil {
            annotationView = MAPPAnnotationView(annotation: annotation, reuseIdentifier: AnnotationViewID)
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
