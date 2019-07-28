//
//  ViewController.swift
//  PlaySoundDisc
//
//  Created by Carlos on 30/07/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    private var reproductor: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let soundURL = Bundle.main.url(forResource: "Nirvana_Smells_Like_Teen_Spirit", withExtension: "mp3")
        do{
            reproductor = try AVAudioPlayer(contentsOf: soundURL!)
        }catch{
            print("Excepcion en el metodo viewDidLoad")
        }
    }

    @IBAction func play() {
        if(!reproductor.isPlaying){
            reproductor.play()
        }
    }
    
    
    @IBAction func pause() {
        if(reproductor.isPlaying){
            reproductor.pause()
        }
    }
    
    
    @IBAction func stop() {
        if(reproductor.isPlaying){
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
    }
    
    
    @IBAction func replay() {
        reproductor.stop()
        reproductor.currentTime = 0.0
        reproductor.play()
    }
}

