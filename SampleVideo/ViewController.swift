//
//  ViewController.swift
//  SampleVideo
//
//  Created by APARNA SRIDHAR on 12/22/14.
//  Copyright (c) 2014 APARNA SRIDHAR. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    var moviePlayer : MPMoviePlayerController?
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playVideo() {
        
        //Get the Video Path
        //You need to put this in Project->Target->copy bundle resource for this to work
        let videoPath = NSBundle.mainBundle().pathForResource("cat", ofType:"mp4")
        
        //Make a URL from your path
        let url = NSURL.fileURLWithPath(videoPath!)
        
        //Initalize the movie player
        moviePlayer = MPMoviePlayerController(contentURL: url)
        
        if let player = moviePlayer {
            
            //Make the player scale the entire view
            player.view.frame = self.view.bounds
            player.scalingMode = .AspectFill
            
            //Add it as a subView to your currentView
            self.view.addSubview(player.view)
            
            //Play the video
            player.prepareToPlay()

        }
        else {
            println("Movie player couldn't be initialized")
        }
    }

}

