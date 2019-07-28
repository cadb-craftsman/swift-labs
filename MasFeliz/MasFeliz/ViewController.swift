//
//  ViewController.swift
//  MasFeliz
//
//  Created by Carlos on 13/04/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblMessage: UILabel!
    let colores = Colores()
    let frases = Frases()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getMessagePositive() {
        view.backgroundColor = colores.getColorAleatorio()
        lblMessage.text = frases.getFraseAleatoria()
    }
    
}

