//
//  ViewController.swift
//  MapaCoordenadas
//
//  Created by Carlos on 15/08/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    private let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        
        var point = CLLocationCoordinate2D()
        point.latitude = 19.52748
        point.longitude = -96.92315
        
        let pin = MKPointAnnotation()
        pin.title = "Xalapa"
        pin.subtitle = "Veracruz"
        pin.coordinate = point
        mapView.addAnnotation(pin)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == .authorizedWhenInUse){
            manager.startUpdatingLocation()
            mapView.showsUserLocation = true
        }else{
            manager.stopUpdatingLocation()
            mapView.showsUserLocation = false
        }
        
    }
}

