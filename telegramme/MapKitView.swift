//
//  MapKitView.swift
//  telegramme
//
//  Created by Shane-Rhys Chua on 10/1/21.
//

import Foundation
import UIKit
import CoreLocation
import MapKit


class MapKitView : UIViewController, CLLocationManagerDelegate{
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationDelegate = LocationDelegate()
    var latestLocation: CLLocation? = nil

    let locationManager = CLLocationManager()
        
        
        

    

    let regionRadius: CLLocationDistance = 250

    func centerMapOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegion (
             center: location.coordinate,
             latitudinalMeters: regionRadius,
             longitudinalMeters: regionRadius)
         
        mapView.setRegion(coordinateRegion, animated: true)
        
        
        
        let annotation = MKPointAnnotation()

        annotation.coordinate = CLLocationCoordinate2D(
            latitude: CLLocationDegrees(51.5074),
            longitude: CLLocationDegrees(0.1278))
        annotation.title = "Ngee Ann Polytechnic"
        annotation.subtitle = "Schoo of ICT"
        self.mapView.addAnnotation(annotation)
        
        
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.delegate = locationDelegate
             
        locationDelegate.locationCallback = { location in
            self.latestLocation = location
            let lat = String(format: "Lat: %3.8f", location.coordinate.latitude)
            let long = String(format: "Long: %3.8f", location.coordinate.longitude)
            print("\(lat), \(long)")
            
            self.centerMapOnLocation(location: location)
            
        }
    }

        
    }
    
//    let manager = CLLocationManager()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        manager.requestWhenInUseAuthorization()
//        manager.delegate = self
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.startUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first{
//            manager.stopUpdatingLocation()
//
//            render(location)
//        }
//    }
//
//    func setRegion(_ region: MKCoordinateRegion,
//                   animated: Bool){}
//
//    func render(_ location: CLLocation){
//
//        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//
//        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//
//        let region = MKCoordinateRegion(center: coordinate, span: span)
//        mapView.setRegion(region, animated: true)
//    }

  
   
    


