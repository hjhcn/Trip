//
//  PaopaoAnnotationView.swift
//  Trip
//
//  Created by haojunhua on 15/3/30.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class PaopaoAnnotationView: BMKAnnotationView {
    
    let Arror_height:CGFloat=6.0
    
    /**
    * 继承无法获取annotation(获取为nil)问题！有待解决
    */
    var anno:BMKAnnotation!
    
    override init!(annotation: BMKAnnotation!, reuseIdentifier: String!) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.backgroundColor=UIColor.clearColor()
        self.canShowCallout=false
        self.image=nil
        self.centerOffset = CGPointMake(0, -50)
        self.frame=CGRectMake(0, 0, 70, 100)
        self.anno=annotation
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setThumb(imageName:String){
        var imageView:UIImageView=UIImageView(image: UIImage(named: imageName))
        imageView.frame=CGRectMake(3,3,64,88)
        imageView.contentMode=UIViewContentMode.ScaleToFill
        imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
        self.addSubview(imageView)
    }
    
    override func drawRect(rect: CGRect) {
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        self.drawInContext(UIGraphicsGetCurrentContext())
        
    }
    
    func drawInContext(context:CGContextRef){
        CGContextSetLineWidth(context, 2.0)
        CGContextSetFillColorWithColor(context,UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).CGColor)
        self.getDrawPath(UIGraphicsGetCurrentContext())
        CGContextFillPath(context)
    }
    
    func getDrawPath(context:CGContextRef)
    {
        var rrect:CGRect = self.bounds
        var radius:CGFloat = 6.0
        
        var minx:CGFloat = CGRectGetMinX(rrect)
        var midx:CGFloat = CGRectGetMidX(rrect)
        var maxx:CGFloat = CGRectGetMaxX(rrect)
        var miny:CGFloat = CGRectGetMinY(rrect)
        // midy = CGRectGetMidY(rrect),
        var maxy:CGFloat = CGRectGetMaxY(rrect)-Arror_height
        CGContextMoveToPoint(context, midx+Arror_height, maxy)
        CGContextAddLineToPoint(context,midx, maxy+Arror_height)
        CGContextAddLineToPoint(context,midx-Arror_height, maxy)
        
        CGContextAddArcToPoint(context, minx, maxy, minx, miny, radius)
        CGContextAddArcToPoint(context, minx, minx, maxx, miny, radius)
        CGContextAddArcToPoint(context, maxx, miny, maxx, maxx, radius)
        CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius)
        CGContextClosePath(context)
    }
}