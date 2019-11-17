//
//  ViewController.swift
//  testCodingPlayMini
//
//  Created by Nova Arisma on 11/11/19.
//  Copyright © 2019 Nova Arisma. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate
{
    
    @IBOutlet weak var photoAlbum: UIImageView!
    @IBOutlet weak var songTitle: MarqueeLabel!
    @IBOutlet weak var sliderProgress: UISlider!
    @IBOutlet weak var playButtonOutlet: UIButton!
    
    var myMediaPlayer = MPMusicPlayerController.systemMusicPlayer
    var nowPlaying: MPMediaItem?
    
//    var lengthyLabel = MarqueeLabel.init(frame: CGRect(x: 20, y: 30, width: 11, height: 11), duration: 8.0, fadeLength: 10)
    
    
    
//    func startMarqueeLabelAnimation() {
//
//        DispatchQueue.main.async(execute: {
//
//            UIView.animate(withDuration: 20.0, delay: 1, options: ([.curveLinear, .repeat]), animations: {() -> Void in
//                self.songTitle.center = CGPoint(x: 0 - self.songTitle.bounds.size.width / 2, y: self.songTitle.center.y)
//
//            }, completion:  nil)
//
//        })
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songTitle.tag = 601
        songTitle.type = .continuous
        songTitle.speed = .duration(15.0)
        songTitle.fadeLength = 10.0
        songTitle.trailingBuffer = 30.0
        
//        let attributedString6 = NSMutableAttributedString(string:"This is a long, attributed string, that's set up to loop in a continuous fashion!")
//        attributedString6.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0.123, green: 0.331, blue: 0.657, alpha: 1.000), range: NSMakeRange(0,34))
//        attributedString6.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0.657, green: 0.096, blue: 0.088, alpha: 1.000), range: NSMakeRange(34, attributedString6.length - 34))
//        attributedString6.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "HelveticaNeue-Light", size:18.0)!, range: NSMakeRange(0, 16))
//        attributedString6.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "HelveticaNeue-Light", size:18.0)!, range: NSMakeRange(33, attributedString6.length - 33))
//        songTitle.attributedText = attributedString6;
        
        
    }
    
    @IBAction func playButtonLabel(_ sender: Any) {
//        if nowPlaying == MPMusicPlayerController.systemMusicPlayer.nowPlayingItem{
//            if  (songTitle.tag == 101){
//                let attributedString6 = NSMutableAttributedString(string: (nowPlaying?.title)!)
//            attributedString6.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor(red:0.657, green:0.078, blue:0.067, alpha:1.000), range:NSMakeRange(0,attributedString6.length))
//            attributedString6.addAttribute(NSAttributedString.Key.font, value:UIFont(name: "HelveticaNeue-Light", size:18.0)!, range:NSMakeRange(0, 16))
//            attributedString6.addAttribute(NSAttributedString.Key.font, value:UIFont(name: "HelveticaNeue-Light", size:18.0)!, range:NSMakeRange(33, attributedString6.length - 33))
//            attributedString6.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red:0.123, green:0.331, blue:0.657, alpha:1.000), range:NSMakeRange(33, attributedString6.length - 33))
//
//            songTitle.attributedText = attributedString6
//
//            } else {
//            let attributedString6 = NSMutableAttributedString(string: (nowPlaying?.title)!)
//            attributedString6.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor(red:0.123, green:0.331, blue:0.657, alpha:1.000), range:NSMakeRange(0,attributedString6.length))
//            attributedString6.addAttribute(NSAttributedString.Key.font, value:UIFont(name: "HelveticaNeue-Light", size:18.0)!, range:NSMakeRange(0, 16))
//            attributedString6.addAttribute(NSAttributedString.Key.font, value:UIFont(name: "HelveticaNeue-Light", size:18.0)!, range:NSMakeRange(33, attributedString6.length - 33))
//                self.songTitle.attributedText = attributedString6
//
//            }
//        }
//
    }
    
    
    
    
    @IBAction func chooseSong(_ sender: Any) {
        let myMediaPickerVC = MPMediaPickerController(mediaTypes: MPMediaType.music)
        myMediaPickerVC.allowsPickingMultipleItems = true
        myMediaPickerVC.popoverPresentationController?.sourceView = sender as? UIView
        myMediaPickerVC.delegate = self as! MPMediaPickerControllerDelegate
        self.present(myMediaPickerVC, animated: true, completion: nil)
        
    }
    
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        myMediaPlayer.setQueue(with: mediaItemCollection)
        mediaPicker.dismiss(animated: true, completion: nil)
        myMediaPlayer.play()
        mediaPicker.showsItemsWithProtectedAssets = false
        getData()
    }
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        mediaPicker.dismiss(animated: true, completion: nil)
    }
    
    func getData ()
    {
        if let nowPlaying = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem{
            songTitle.text = nowPlaying.title
            photoAlbum.image = nowPlaying.artwork?.image(at: CGSize(width: 250, height: 250))
        }
    }
    
    
    
    
}
