//
//  InterfaceController.swift
//  WatchOsIMC WatchKit Extension
//
//  Created by Carlos on 16/05/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var pesoValor: WKInterfaceLabel!
    @IBOutlet var estaturaValor: WKInterfaceLabel!
    
    var pesoActual : Float = 0
    var estaturaActual : Float = 0
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func modificarPeso(_ value: Float) {
        pesoActual += value
        pesoValor.setText(String(pesoActual))
    }
    
    @IBAction func modificarEstatura(_ value: Float) {
        estaturaActual += value / 100
        estaturaValor.setText(String(estaturaActual))
    }
    
    @IBAction func calcularIMC() {
        let imc = calcularIMC(peso: pesoActual, estatura: estaturaActual)
        let contexto = Datos(descripcion:"Peso Normal", imc: imc)
        pushController(withName: "IdentificadorDatos", context: contexto)
        print("imc: ", imc)
    }
    
    func calcularIMC(peso: Float, estatura: Float) -> Float{
        return pesoActual	/ (estaturaActual * estaturaActual)
    
    }
}
