//
//  ViewController.swift
//  RestApp
//
//  Created by Carlos on 08/06/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sincrono()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sincrono() {
        let urls = "http://dia.ccm.itesm.mx/"
        let url = NSURL(string: urls)
        let datos: NSData? = NSData(contentsOf: url! as URL)
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
    }
    
    func asincrono() {
        let urls = "http://dia.ccm.itesm.mx/"
        let url = NSURL(string: urls)
        let session = URLSession.shared
        let bloque = {(datos: NSData?, URLResponse: URLResponse, Error: NSError) -> Void in
            let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        }
        
        //let dt = session.dataTask(with: url, completionHandler: {(NSData, URLResponse, NSError) -> Void in
        //    let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)})
        //dt?.resume()
        print("")
    }
}

