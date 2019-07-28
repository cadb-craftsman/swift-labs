//
//  Datos.swift
//  WatchOsIMC
//
//  Created by Carlos on 18/05/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import WatchKit

class Datos: NSObject {
    var descripcion:String=""
    var imc:Float=0
    
    init(descripcion: String, imc: Float) {
        self.descripcion = descripcion
        self.imc = imc
    }   

}
