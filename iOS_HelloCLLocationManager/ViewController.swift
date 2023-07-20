//
//  ViewController.swift
//  iOS_HelloCLLocationManager
//
//  Created by 王麒翔 on 2023/7/20.
//

import UIKit
import MapKit
import CoreLocation // 目前位置

class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization() // 請求授權
        
        if let coordinate = locationManager?.location?.coordinate{ // 目前座標
            let xScale:CLLocationDegrees = 0.01
            let yScale:CLLocationDegrees = 0.01
            let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            
            let region = MKCoordinateRegion(center: coordinate, span: span)
            map.setRegion(region, animated: true)
        }
    }


}

