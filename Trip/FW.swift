//
//  FW.swift
//  Trip
//
//  Created by haojunhua on 15/4/13.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import Foundation

class FW: NSObject {
    var id:Int=0
    var name:String=""
    var picPath:String=""
    var detailDesc:String=""
    var location:CLLocationCoordinate2D=CLLocationCoordinate2D(latitude: 39.915,longitude: 116.404)
    init(id:Int,name:String,picPath:String,detailDesc:String,location:CLLocationCoordinate2D){
        self.id=id
        self.name=name
        self.picPath=picPath
        self.detailDesc=detailDesc
        self.location=location
    }
    
}
