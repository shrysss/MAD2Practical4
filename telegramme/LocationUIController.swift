//
//  Location.swift
//  telegramme
//
//  Created by Shane-Rhys Chua on 10/1/21.
//

import UIKit
import CoreLocation

class LocationUIController: UIViewController{
    let locationDelegate = LocationDelegate()
    var latestLocation: CLLocation? = nil
    
    let locationManager: CLLocationManager = {
        $0.requestWhenInUseAuthorization()
        $0.desiredAccuracy = kCLLocationAccuracyBest
        $0.startUpdatingLocation()
        $0.startUpdatingHeading()
        return $0
    }(CLLocationManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = locationDelegate
        
        locationDelegate.locationCallback = {location in
            self.latestLocation = location
            let lat = String(format: "Lat: %3.8f".location.coordinate.latitude)
            let long = String(format: "Long %3.8f".location.coordinate.longtitude)
            print("\(lat), \(long)")
        }
    }
}



class MKMapView : UIView{
    
    init?(center: CLLocationCoordinate2D,
         latitudinalMeters: CLLocationDistance,
         longitudinalMeters: CLLocationDistance)
    
    func setRegion(_ region: MKCoordinateRegion,
                   animated : Bool



    )
    let regionRadius: CLLocationDistance = 250

    func centerMapOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegion (
             center: location.coordinate,
             latitudinalMeters: regionRadius,
             longitudinalMeters: regionRadius)
         
        map.setRegion(coordinateRegion, animated: true)
    }

    override func viewDidLoad() {
            super.viewDidLoad()
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


