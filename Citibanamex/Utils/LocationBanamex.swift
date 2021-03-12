//
//  Location.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//

import UIKit
import CoreLocation


class LocationBanamex:NSObject {
  public static let share = LocationBanamex()
  public var locationManager =  CLLocationManager()
  var currentLocation = CLLocation()
  
  override init() {
    super.init()
    locationManager.delegate = self
  }
  
  
  func validateLocationPermissions(viewController: UIViewController? = nil ,completion:((CLLocation?) -> Void)? = nil) {
    
    print("validateLocationPermissions...")
    
    switch  CLLocationManager.authorizationStatus() {
      
      case .authorizedAlways,.authorizedWhenInUse:
        #if DEBUG
        print("Permisos de ubicacion autorizados")
        #endif
        locationManager.startUpdatingLocation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
          #if DEBUG
          print("Se ejecuta completion de validateLocationPermissions")
          #endif
          completion?(self.currentLocation)
          
        }
      case .denied,.restricted:

        let alert = UIAlertController(title: "LOCATION_TITLE_ALERT".localized(), message: "LOCATION_BODY_ALERT".localized(), preferredStyle: .alert)
        
        let actionYes = UIAlertAction(title: "Ir a Configuración", style: .default) {  (Action) in
          
          guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
          }
          
          if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Se ejecuta completion de validateLocationPermissions")
             
            })
          }
        }
        
        let actionNo = UIAlertAction(title: "Cancelar", style: .default, handler: { (success) in

            print("Se ejecuta completion de validateLocationPermissions")
            print("AlertAction: NO")
            
        })
        
        alert.addAction(actionNo)
        alert.addAction(actionYes)
        
        
        guard let vc = viewController else {
          completion?(nil)
          return
        }
        
        vc.present(alert, animated: true, completion: nil)
        
      case .notDetermined:
        print("notDetermined")
        locationManager.requestWhenInUseAuthorization()
      @unknown default:
        print("Error Desconocido")
    }
  }
}


extension LocationBanamex: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locationManager.stopUpdatingLocation()
        guard let location = locations.last else { return }
        

        currentLocation = location
    }
    
}
