//
//  MapViewController.swift
//  Pop
//
//  Created by Victor Odouard on 12/28/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    /* let mapView = MKMapView() */
    var mapView = GMSMapView()
    let label = UILabel()
    let button = UIButton()
    
    var coreLocationManager = CLLocationManager()
    var locationManager: LocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(displayP3Red: 75/255, green: 0, blue: 200/255, alpha: 1.0)
        
        mapView.frame = CGRect(x: 0, y: view.frame.height * 0.15, width: view.frame.width, height: view.frame.height * 0.35)
        label.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: 20)
        button.frame = CGRect(x: 0, y: label.frame.height + 20, width: view.frame.width, height: 20)
        button.backgroundColor = .red
        
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "purpleRainMapStyle", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find mapStyle.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        label.text = "hi"
        button.setTitle("Update", for: .normal)
        button.addTarget(self, action: #selector(updateButton), for: .touchUpInside)
        
        view.addSubview(mapView)
        view.addSubview(button)
        view.addSubview(label)
        
        locationManager = LocationManager.sharedInstance
        
        coreLocationManager.delegate = self
        coreLocationManager.requestAlwaysAuthorization()
        
        
        let authorizationCode = CLLocationManager.authorizationStatus()
        
        /*
        if authorizationCode == CLAuthorizationStatus.notDetermined {
            print("not determined")
        } else {
            print("determined")
        }*/
        
        if authorizationCode == CLAuthorizationStatus.denied {
            
        } else {
            getLocation()
        }
        
        
        

        // Do any additional setup after loading the view.
    }
    
    func getLocation() {
        locationManager.startUpdatingLocationWithCompletionHandler { (latitude, longitude, status, verboseMessage, error) -> () in self.displayLocation(location: CLLocation(latitude: latitude, longitude: longitude)) }
        
    }
    
    func displayLocation(location: CLLocation) {
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 10)
        
        mapView.camera = camera
        
        let locationCoord = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
       
        let marker = GMSMarker(position: locationCoord)
        marker.map = mapView
        
        
        //mapView.addAnnotation(annotation)
        //mapView.showAnnotations([annotation], animated: true)
        
        locationManager.reverseGeocodeLocationWithCoordinates(location) { (reverseGeoCodeInfo, placemark, error) in
            let address = reverseGeoCodeInfo?.object(forKey: "formattedAddress") as! String
            self.label.text = address
        }
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != CLAuthorizationStatus.denied && status != CLAuthorizationStatus.restricted && status != CLAuthorizationStatus.notDetermined {
            getLocation()
        }
    }
    
    
    func updateButton() {
        getLocation()
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
