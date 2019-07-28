//
//  ViewController.swift
//  ManejoSensores
//
//  Created by Carlos on 09/08/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    
    @IBOutlet weak var yLabel: UILabel!
    
    @IBOutlet weak var zLabel: UILabel!
    
    private let manejador = CMMotionManager()
    private let queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clear(_ sender: UIButton) {
        xLabel.text = ""
        yLabel.text = ""
        zLabel.text = ""
    }
}

