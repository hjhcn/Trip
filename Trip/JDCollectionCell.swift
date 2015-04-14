//
//  ScenicSpotCollectionCell.swift
//  Trip
//
//  Created by haojunhua on 15/4/1.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class JDCollectionCell: UICollectionViewCell{
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var _view:UIView!
    
    @IBOutlet weak var _image: UIImageView!
    
    var _jd:JD!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}