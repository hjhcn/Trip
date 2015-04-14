//
//  CornerRadiusView.swift
//  Trip
//
//  Created by haojunhua on 15/4/9.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class CornerRadiusView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds=true
        self.layer.cornerRadius=5.0
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.masksToBounds=true
        self.layer.cornerRadius=5.0
    }

}
