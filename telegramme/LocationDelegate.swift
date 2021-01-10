//
//  LocationDelegate.swift
//  telegramme
//
//  Created by Shane-Rhys Chua on 11/1/21.
//

import CoreLocation
import Foundation


class LocationDelegate : NSObject, CLLocationManagerDelegate
{
    var locationCallback: ((CLLocation) -> ())? = nil
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation])
    {
        guard let currentLocation = locations.last else { return }
        locationCallback?(currentLocation)
    }
}
