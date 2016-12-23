//
//  ViewController.swift
//  StreamingVideo
//
//  Created by Jonatan Londoño Taborda on 12/21/16.
//  Copyright © 2016 Jonatan Londoño Taborda. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ViewController: UIViewController {

    var movPlayer : AVPlayerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //usingAVPlayerViewController()
        
        //playStreaming()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func usingAVPlayerViewController() {
        let videoURL = NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL! as URL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        self.present(playerViewController, animated: true, completion: nil)
        
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    
    private func playStreaming() {
        let videoURL = NSURL(string: "http://10.60.26.94/hls-vod/hls_sample1_manifest.m3u8")
        let player = AVPlayer(url: videoURL! as URL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AVPlayerViewController
        let url = URL(string: "http://10.60.26.94/hls-vod/hls_sample1_manifest.m3u8")
        if let movieURL = url {
            destination.player = AVPlayer(url: movieURL)
            destination.player?.play()
        }
    }
}

