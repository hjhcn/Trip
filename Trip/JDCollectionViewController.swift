//
//  JDCollectionViewController.swift
//  Trip
//
//  Created by haojunhua on 15/4/1.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

let reuseIdentifier = "JDCollectionCell"

class JDCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return DataSource().JDDatas.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! JDCollectionCell
        var jd:JD=DataSource().JDDatas[indexPath.row]
        cell._jd=jd
        cell.nameLabel.text=jd.name
        cell._view.layer.masksToBounds=true
        cell._view.layer.cornerRadius=10.0
        cell._image.image=UIImage(named: jd.picPath)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var jd:JD = DataSource().JDDatas[self.collectionView!.indexPathsForSelectedItems()[0].row]
        var jdViewController:JDViewController = segue.destinationViewController as! JDViewController;
        jdViewController._jd = jd
    }
}
