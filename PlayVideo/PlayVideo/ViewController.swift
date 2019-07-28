//
//  ViewController.swift
//  PlayVideo
//
//  Created by Carlos on 30/07/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    private var reproductor: AVPlayer!
    private var controlador: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let videoURL = Bundle.main.url(forResource: "Nirvana_Smells_Like_Teen_Spirit", withExtension: "mp4")
        reproductor = AVPlayer(url: videoURL!)
        controlador = AVPlayerViewController()
        controlador.player = reproductor
    
    }

    @IBAction func play() {
        self.addChildViewController(controlador)
        controlador.view.frame = CGRect(x: 10.0,y: 20.0,width: 350.0,height: 250.0)
        self.view.addSubview(controlador.view)
        reproductor.play()
        
    }
}

