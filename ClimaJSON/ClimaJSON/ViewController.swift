//
//  ViewController.swift
//  ClimaJSON
//
//  Created by Carlos on 12/06/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var ciudad: UILabel!
    @IBOutlet weak var temperatura: UILabel!
    
    var ciudades: Array<Array<String>> = Array<Array<String>>()
    let URL_QUERY = "https://query.yahooapis.com/v1/public/yql?format=json&q=select%20*%20from%20weather.forecast%20where%20woeid%20=%20"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ciudades.append(["Caracas", "395269"])
        ciudades.append(["Paris", "615702"])
        ciudades.append(["Madrid", "766273"])
        ciudades.append(["Irapuato", "90289715"])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ciudades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ciudades[row][0]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let urls = URL_QUERY + ciudades[row][1]
        let url = NSURL(string: urls)
        
        do{
            
            let datos: NSData! = NSData(contentsOf: url! as URL)
            let json = try JSONSerialization.jsonObject(with: datos as Data, options: JSONSerialization.ReadingOptions.mutableLeaves)
            let dicRoot = json as! NSDictionary
            let dicQuery =  dicRoot["query"] as! NSDictionary
            let dicResults = dicQuery["results"] as! NSDictionary
            let dicChannel = dicResults["channel"] as! NSDictionary
            let dicLocation = dicChannel["location"] as! NSDictionary
            let dicItem = dicChannel["item"] as! NSDictionary
            let dicCondition = dicItem["condition"] as! NSDictionary
            
            let city = dicLocation["city"] as! NSString
            let temp = dicCondition["temp"] as! NSString
            
            ciudad.text = String(city)
            temperatura.text = String(temp)
            
            print(dicQuery)
        } catch _{
        
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }


}

