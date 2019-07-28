//
//  JSONConnection.swift
//  ClimaTablesJSON
//
//  Created by Carlos on 15/06/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import Foundation

class JSONCOnnection{

    
    let URL_QUERY = "https://query.yahooapis.com/v1/public/yql?format=json&q=select%20*%20from%20weather.forecast%20where%20woeid%20=%20"

    func getJsonData(codCiudad: String) throws -> String {
        let urls = URL_QUERY + codCiudad
        let url = NSURL(string: urls)
        var temperature: String = ""
        do{
            
            let datos: NSData! = NSData(contentsOf: url! as URL)
            let json = try JSONSerialization.jsonObject(with: datos as Data, options: JSONSerialization.ReadingOptions.mutableLeaves)
            let dicRoot = json as! NSDictionary
            let dicQuery =  dicRoot["query"] as! NSDictionary
            let dicResults = dicQuery["results"] as! NSDictionary
            let dicChannel = dicResults["channel"] as! NSDictionary
            let dicItem = dicChannel["item"] as! NSDictionary
            let dicCondition = dicItem["condition"] as! NSDictionary
            let temp = dicCondition["temp"] as! NSString
            
            temperature = String(temp)
            print(dicQuery)
        } catch _{
            
        }
    
        return temperature
    }

}
