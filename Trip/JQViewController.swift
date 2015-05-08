//
//  JQViewControllerswift
//  Trip
//
//  Created by haojunhua on 15/3/31.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit
import AVFoundation.AVPlayer

class JQViewController: UIViewController,AACDelegate,UIAlertViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var playBtton: UIBarButtonItem!
    @IBOutlet var testTag: UITapGestureRecognizer!
    
    @IBOutlet weak var _coverImage: UIImageView!
    
    @IBOutlet weak var _intro: UITextView!
    
    @IBOutlet weak var _phone: UILabel!
    
    @IBOutlet weak var _position: UILabel!
    
    @IBOutlet weak var _price: UILabel!
    
    var _audioCtler:AvAudioController!
    var _playBttonIndex:Int8=0
    var _jq:JQ!
    
    override func viewWillAppear(animated: Bool) {
        
        println("--viewWillAppear\(NSDate().timeIntervalSince1970)")
        
        self.navigationItem.title=_jq.name
        
        scrollView.contentSize.height = 700
        
        _coverImage.image=UIImage(named: _jq.picPath)
        
        _intro.layer.masksToBounds=true
        _intro.layer.cornerRadius=5.0
        
        _audioCtler=AvAudioController(resName: "gugong", type: "m4a")
        _audioCtler.setDelegate(self)
        
        _phone.text=_jq.phone
        _position.text=_jq.address
        _price.text="￥\(_jq.price)/人"
        
        var paragraphStyle:NSMutableParagraphStyle=NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 22.0
        paragraphStyle.maximumLineHeight = 22.0
        paragraphStyle.minimumLineHeight = 15.0
        paragraphStyle.firstLineHeadIndent = 20.0
        var attributes:NSDictionary=[
            NSParagraphStyleAttributeName:paragraphStyle,
            NSFontAttributeName:UIFont.systemFontOfSize(14),
            NSForegroundColorAttributeName:UIColor.darkGrayColor()
        ]
        _intro.attributedText = NSAttributedString(string: _jq.detailDesc, attributes: attributes as [NSObject : AnyObject])
        
    }

    
    @IBAction func playAudio(sender: UIBarButtonItem) {
        _audioCtler.toggle()
    }
    
    
    @IBAction func clickPhone(sender: AnyObject) {
        UIAlertView(title: "要拨打电话吗？", message: "\(_jq.phone)", delegate: self, cancelButtonTitle: "取消", otherButtonTitles:"OK").show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex==1 {
            let telURL:NSURL! = NSURL(string: "tel:\(_jq.phone)")
            UIApplication.sharedApplication().openURL(telURL)
        }
    }
    
    func audioCallback(cmd: AvAudioCmd) {
        switch cmd{
        case .Start:
            "Start"
        case .Pause:
            fallthrough
        case .End:
            playBtton.image=UIImage(named: "bababa3.png")
        case .Stop:
            "Stop"
        }
    }
    
    func audioPlayingCallback(process: Float) {
        _playBttonIndex=(_playBttonIndex)%4
        playBtton.image=UIImage(named: "bababa\(_playBttonIndex).png")
        _playBttonIndex++
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var positionViewController:PositionViewController = segue.destinationViewController as! PositionViewController;
        positionViewController._location=_jq.location
    }
    
}
