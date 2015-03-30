//
//  Scenic.swift
//  Trip
//
//  Created by haojunhua on 15/3/29.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import Foundation

class Scenic: NSObject {
    var id:Int
    var name:String
    var thumbPath:String=""
    var detailDesc:String=""
    var picPath:String=""
    var audioPath:String=""
    var phone:String=""
    /**
    * 地址
    */
    var address:String=""
    var ticketPrice:Int=0 //人民币
    var location:CLLocationCoordinate2D=CLLocationCoordinate2D(latitude: 39.915,longitude: 116.404)
    
    init(id:Int,name:String){
        self.id=id
        self.name=name
    }
}
