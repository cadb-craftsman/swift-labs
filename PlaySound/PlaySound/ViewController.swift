//
//  ViewController.swift
//  PlaySound
//
//  Created by Carlos on 23/07/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    private var reproductor: SystemSoundID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let soundURL = Bundle.main.url(forResource: "Nirvana_Smells_Like_Teen_Spirit", withExtension: "mp3")
            AudioServicesCreateSystemSoundID(soundURL! as CFURL, &reproductor)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func playSound() {
        AudioServicesPlaySystemSound(reproductor)
    }
}

