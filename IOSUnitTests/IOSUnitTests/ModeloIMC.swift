//
//  ModeloIMC.swift
//  IOSUnitTests
//
//  Created by Carlos on 30/05/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import Foundation

class ModeloIMC{

    var peso: Float = 0;
    var estatutra: Float = 0;
    
    func calcularIMC() -> Float {
        var imc = peso / (estatutra * estatutra)
        imc = round(imc * 100) / 100
        
        return imc
    }

}
