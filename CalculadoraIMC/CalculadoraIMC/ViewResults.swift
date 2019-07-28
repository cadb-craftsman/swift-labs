//
//  ViewResults.swift
//  CalculadoraIMC
//
//  Created by Carlos on 28/04/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit

class ViewResults: UIViewController {

    var indiceIM:Double = 0
    @IBOutlet weak var totalIMC: UILabel!
    @IBOutlet weak var resultadoIMC: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        totalIMC.text = String(indiceIM)
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
