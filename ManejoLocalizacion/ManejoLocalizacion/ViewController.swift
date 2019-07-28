//
//  ViewController.swift
//  ManejoLocalizacion
//
//  Created by Carlos on 16/08/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var labelLatitud: UILabel!
    @IBOutlet weak var labelLongitud: UILabel!
    @IBOutlet weak var labelExactitud: UILabel!
    @IBOutlet weak var labelNMagnetico: UILabel!
    @IBOutlet weak var labelNGeografico: UILabel!
    
    private let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
    
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedWhenInUse){
            manager.startUpdatingLocation()
            manager.startUpdatingHeading()
        }else{
            manager.stopUpdatingLocation()
            manager.stopUpdatingHeading()
        }
    }
    
    func  locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        labelLatitud.text = String(manager.location!.coordinate.latitude)
        labelLongitud.text = String(manager.location!.coordinate.longitude)
        labelExactitud.text = String(manager.location!.horizontalAccuracy)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        labelNMagnetico.text = String(newHeading.magneticHeading)
        labelNGeografico.text = String(newHeading.trueHeading)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let alert = UIAlertController(title: "ERROR", message: "error " + error.localizedDescription, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Ok", style: .default, handler: {action in print("Ok")})
        
        alert.addAction(buttonOK)
        self.present(alert, animated: true, completion: nil)
    }

}

