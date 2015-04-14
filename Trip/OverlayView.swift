//
//  OverlayView.swift
//  Trip
//
//  Created by haojunhua on 15/3/27.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class OverlayView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var label: UILabel!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "Overlay", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
    
    
}
