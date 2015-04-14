//
//  MAPPAnnotationView.swift
//  Trip
//
//  Created by haojunhua on 15/4/12.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class MAPPAnnotationView: MAAnnotationView {
    
    let Arror_height:CGFloat=6.0
    
    var _bgImageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override init!(annotation: MAAnnotation!, reuseIdentifier: String!) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.backgroundColor=UIColor.clearColor()
        self.canShowCallout=false
        self.image=nil
        self.centerOffset = CGPointMake(0, -45)
        self.frame=CGRectMake(0, 0, 67, 91)
        
        _bgImageView=UIImageView(image: UIImage(named: "map_annotation.png"))
        self.addSubview(_bgImageView)
    }
    
    func setThumb(imageName:String){
        var imageView:UIImageView=UIImageView(image: UIImage(named: imageName))
        imageView.frame=CGRectMake(7,6.5,50.5,63.5)
        imageView.contentMode=UIViewContentMode.ScaleAspectFill
        imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
        _bgImageView.addSubview(imageView)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
