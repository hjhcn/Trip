//
//  AvAudioController.swift
//  Trip
//
//  Created by haojunhua on 15/4/6.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import Foundation
import AVFoundation.AVPlayer

enum AvAudioCmd {
    case Start
    case Pause
    case End //播放结束
    case Stop //手动停止
}

protocol AACDelegate :NSObjectProtocol{
    func audioCallback(cmd:AvAudioCmd)
    
    func audioPlayingCallback(process:Float)
}

class AvAudioController: NSObject, AVAudioPlayerDelegate{
    
    var _audioPlayer:AVAudioPlayer!
    var _timer:NSTimer!
    var _delegate:AACDelegate!
    
    
    init(resName:String,type:String) {
        var path:NSString=NSBundle.mainBundle().pathForResource(resName, ofType:type)!
        _audioPlayer=AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path as String),error: nil)
    }
    
    func setDelegate(delegate:AACDelegate){
        _delegate=delegate
        _audioPlayer.delegate=self
    }
    
    /**
     * 从time开始播放
     */
    func play(time:NSTimeInterval){
        _audioPlayer.currentTime=time
        play()
    }
    
    func play(){
        if _timer==nil{
            _timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "timerFireMethod:", userInfo: nil, repeats:true);
            _timer.fire()
        }else{
            _timer.fireDate=NSDate()
        }
        _audioPlayer.play()
        _delegate.audioCallback(AvAudioCmd.Start)
    }
    
    func rePlay(){
        if _timer==nil{
            println("没有play之前不可以replay")
            return
        }
        _audioPlayer.currentTime=0
        _audioPlayer.play()
        _timer.fireDate=NSDate()
        _delegate.audioCallback(AvAudioCmd.Start)
    }
    
    func pause(){
        _audioPlayer.pause()
        _timer.fireDate=NSDate.distantFuture() as! NSDate
        _delegate.audioCallback(AvAudioCmd.Pause)
    }
    
    /* 手动停止，并且重置播放时间*/
    func stop(){
        _audioPlayer.stop()
        _audioPlayer.currentTime=0
        if _timer != nil {
            _timer.invalidate()
            _timer=nil
        }
        _delegate.audioCallback(AvAudioCmd.Stop)
    }
    
    func isPlaying() -> Bool{
        return _audioPlayer.playing
    }
    
    func resume(){
        _audioPlayer.play()
        _timer.fireDate=NSDate()
    }
    
    func toggle(){
        if _audioPlayer.playing {
            self.pause()
        }else{
            self.play()
        }
    }
    
    func duration() -> Double{
        return _audioPlayer.duration
    }
    
    func timerFireMethod(timer: NSTimer) {
        var process = (Float)(_audioPlayer.currentTime/_audioPlayer.duration)
        _delegate.audioPlayingCallback(process)
    }
    
    func audioPlayerBeginInterruption(player: AVAudioPlayer!) {
        println("audioPlayerBeginInterruption")
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        _delegate.audioCallback(AvAudioCmd.End)
        if _timer != nil {
            _timer.invalidate()
            _timer=nil
        }
    }
    
    
}
