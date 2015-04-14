//
//  JQ.swift
//  Trip
//
//  Created by haojunhua on 15/4/3.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import Foundation

class JQ: NSObject {
    var id:Int=0
    var name:String=""
    var picPath:String=""
    var audioPath:String=""
    var detailDesc:String=""
    var location:CLLocationCoordinate2D=CLLocationCoordinate2D(latitude: 39.915,longitude: 116.404)
    var phone:String=""
    var address:String=""
    var price:Int=0
    
    init(id:Int,name:String,picPath:String,audioPath:String,detailDesc:String,location:CLLocationCoordinate2D){
        self.id=id
        self.name=name
        self.picPath=picPath
        self.audioPath=audioPath
        self.detailDesc=detailDesc
        self.location=location
    }
    
    init(id:Int,name:String,picPath:String,audioPath:String,detailDesc:String,location:CLLocationCoordinate2D,phone:String,address:String,price:Int){
        self.id=id
        self.name=name
        self.picPath=picPath
        self.audioPath=audioPath
        self.detailDesc=detailDesc
        self.location=location
        self.phone=phone
        self.address=address
        self.price=price
    }

}
