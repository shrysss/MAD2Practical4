//
//  MKMapViewDelegate.swift
//  telegramme
//
//  Created by Shane-Rhys Chua on 10/1/21.
//


import CoreLocation



class MKMapViewDelegate : NSObject, CLLocationManagerDelegate
{
    var locationCallback: ((CLLocation) -> ())? = nil
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation])
    {
        guard let currentLocation = locations.last else { return }
        locationCallback?(currentLocation)
    }
}
