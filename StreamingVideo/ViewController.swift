//
//  ViewController.swift
//  StreamingVideo
//
//  Created by Jonatan Londoño Taborda on 12/21/16.
//  Copyright © 2016 Jonatan Londoño Taborda. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    var moviePlayer : MPMoviePlayerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playVideo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func playVideo() {
        let path = "http://10.60.26.243/hls-vod/hls_sample1_manifest.m3u8"
            let url = NSURL(string:path)
            moviePlayer = MPMoviePlayerController(contentURL: url as URL!)
            moviePlayer?.view.frame = self.view.bounds
            moviePlayer?.prepareToPlay()
            moviePlayer?.scalingMode = .aspectFill
            self.view.addSubview((moviePlayer?.view)!)

    }

}

