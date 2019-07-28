//
//  TemperaturasViewController.swift
//  ClimaTablesJSON
//
//  Created by Carlos on 14/06/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit

class TemperaturasViewController: UIViewController {

    var codCiudad = String()
    var json = JSONCOnnection()
    @IBOutlet weak var temperature: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        do{
            temperature.text = try json.getJsonData(codCiudad: codCiudad)
        } catch {
            print("Se ha producido una excepcion al obtener el json")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
