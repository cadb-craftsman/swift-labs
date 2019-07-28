//
//  ViewController.swift
//  CalculadoraIMC
//
//  Created by Carlos on 24/04/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textPeso: UITextField!
    @IBOutlet weak var textEstatura: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textPeso.delegate = self
        textEstatura.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let iPeso: Double = Double(self.textPeso.text!)!
        let iEstatura: Double = Double(self.textEstatura.text!)!
        let totalIMC = calcularTotalIMC(peso: iPeso, estatura: iEstatura)
        
        let nextView = segue.destination as! ViewResults
        nextView.indiceIM = totalIMC
    }
    
    
    @IBAction func backgroundTap(sender: UIControl){    
        textPeso.resignFirstResponder()
        textEstatura.resignFirstResponder()
    }
    
    @IBAction func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }

    @IBAction func calcularIMC(_ sender: Any) {
        let iPeso: Double = Double(self.textPeso.text!)!
        let iEstatura: Double = Double(self.textEstatura.text!)!
        let totalIMC = calcularTotalIMC(peso: iPeso, estatura: iEstatura)
        
        print("totalIMC: ", totalIMC)
    }
    
    func calcularTotalIMC(peso: Double, estatura: Double) ->Double{
        var totalIMC: Double
        totalIMC = peso/(estatura * estatura)
        return totalIMC    
    }
}

