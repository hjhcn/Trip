//
//  FWViewController.swift
//  Trip
//
//  Created by haojunhua on 15/4/13.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit

class FWViewController: UIViewController {
    
    var _fw:FW!

    @IBOutlet weak var _imageView: UIImageView!
    
    @IBOutlet weak var _textView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        var paragraphStyle:NSMutableParagraphStyle=NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 22.0
        paragraphStyle.maximumLineHeight = 22.0
        paragraphStyle.minimumLineHeight = 15.0
        paragraphStyle.firstLineHeadIndent = 20.0
        var attributes:NSDictionary=[
            NSParagraphStyleAttributeName:paragraphStyle,
            NSFontAttributeName:UIFont.systemFontOfSize(15),
            NSForegroundColorAttributeName:UIColor.blackColor()
        ]
        _textView.attributedText = NSAttributedString(string: _fw.detailDesc, attributes: attributes as [NSObject : AnyObject])
        
        _imageView.image=UIImage(named: _fw.picPath)
        self.navigationItem.title=_fw.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
