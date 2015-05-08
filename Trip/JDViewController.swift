//
//  JDViewController.swift
//  Trip
//
//  Created by haojunhua on 15/4/4.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import UIKit
import AVFoundation.AVPlayer

class JDViewController: UIViewController,AACDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var _playBtn: UIButton!
    @IBOutlet weak var _slider: UISlider!
    @IBOutlet weak var _imageView: UIImageView!
    
    var _audioCtler:AvAudioController!
    var _isTouchProgress:Bool=false
    var _jd:JD!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        _audioCtler.stop()
        self.navigationController?.navigationBar.titleTextAttributes =
            NSDictionary(object: UIColor.blackColor(), forKey: NSForegroundColorAttributeName) as [NSObject : AnyObject]
        UIApplication.sharedApplication().statusBarStyle=UIStatusBarStyle.Default
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "voi_black.png"), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.titleTextAttributes =
            NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName) as [NSObject : AnyObject]
        UIApplication.sharedApplication().statusBarStyle=UIStatusBarStyle.LightContent
        
        var paragraphStyle:NSMutableParagraphStyle=NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 22.0
        paragraphStyle.maximumLineHeight = 22.0
        paragraphStyle.minimumLineHeight = 15.0
        paragraphStyle.firstLineHeadIndent = 20.0
        var attributes:NSDictionary=[
            NSParagraphStyleAttributeName:paragraphStyle,
            NSFontAttributeName:UIFont.systemFontOfSize(15),
            NSForegroundColorAttributeName:UIColor.whiteColor()
        ]
        textView.attributedText = NSAttributedString(string: _jd.detailDesc, attributes: attributes as [NSObject : AnyObject])
        _slider.value=0
        
        _imageView.image=UIImage(named: _jd.picPath)
        self.navigationItem.title=_jd.name
    }
    
    override func viewDidAppear(animated: Bool) {
        _audioCtler = AvAudioController(resName:"gugong",type:"m4a")
        _audioCtler.setDelegate(self)
        _audioCtler.play()
        
        println(NSDate().timeIntervalSince1970)
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func clickPlayer(sender: AnyObject) {
        _audioCtler.toggle()
    }
    
    
    func audioCallback(cmd: AvAudioCmd) {
        switch cmd{
        case .Start:
            _playBtn.setImage(UIImage(named: "gode_stop.png"), forState: UIControlState.Normal)
        case .End:
            _slider.value=1
            fallthrough
        case .Pause:
            _playBtn.setImage(UIImage(named: "gode_play.png"), forState: UIControlState.Normal)
        case .Stop:
            "Stop"
        }
        
    }
    
    func audioPlayingCallback(process: Float) {
        if !_isTouchProgress {
            _slider.value=process
        }
    }
    
    @IBAction func touchDownProgress(sender: UISlider) {
        _isTouchProgress=true
    }
    
    @IBAction func touchInProgress(sender: UISlider) {
        _isTouchProgress=false
        var time:Double=_audioCtler.duration()*Double(sender.value)
        _audioCtler.play(time)
    }
    
    @IBAction func touchOutProgress(sender: UISlider) {
        _isTouchProgress=false
        var time:Double=_audioCtler.duration()*Double(sender.value)
        _audioCtler.play(time)
    }
    
}
