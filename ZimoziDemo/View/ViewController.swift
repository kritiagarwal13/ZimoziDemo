//
//  ViewController.swift
//  ZimoziDemo
//
//  Created by Kriti Agarwal on 27/02/21.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController {
    
    //MARK:- @IBOutlets
    @IBOutlet weak var mapView: GMSMapView!
    
    
    //MARK:- Properties
    var camera = GMSCameraPosition()
    var controller = MainController()
    var googleMapView: GMSMapView?
    var model = [Items]()
    var nearByPlacesArray = [Cameras]()
    private let locationManager = CLLocationManager()
    private var location: CLLocationCoordinate2D?
    
    
    //MARK:- Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.mapView.setMinZoom(2, maxZoom: 20)
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        controller.delegate = self
        var params = JSONDictionary()
        params["date_time"] = Date().toString(dateFormat: "yyyy-MM-dd'T'HH:mm:ssZ")
        controller.getMapValues(params)
    }
    
    
    //MARK:- Extra Methods
    func showCurrentLocationOnMap(){
        let camera = GMSCameraPosition.camera(withLatitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0, zoom: 8.0) //Set default lat and long
        self.mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: self.mapView.frame.size.width, height: self.mapView.frame.size.height), camera: camera)
        self.view.addSubview(self.mapView ?? GMSMapView())
        
        
        for data in nearByPlacesArray{
            let location = CLLocationCoordinate2D(latitude: data.location?.latitude ?? 0.0, longitude: data.location?.longitude ?? 0.0)
            print("location: \(location)")
            let marker = GMSMarker()
            marker.icon = UIImage(named: "gmarker")
            marker.position = location
            marker.snippet = data.camera_id
            marker.map = self.mapView
        }
    }

    
    //MARK:- @IBActions
    
    
}

extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print(error.localizedDescription)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
//        self.location = locations.first?.coordinate
        self.locationManager.stopUpdatingLocation()
        self.showCurrentLocationOnMap()
//        if let location = self.location{
//            self.mapView.camera = GMSCameraPosition.camera(withTarget: location, zoom: 12)
//        }
        
    }
}


extension ViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        print(position.target)
        self.location = position.target
    }
}


extension ViewController: MainControllerDelegate {
    
    func getMapValuesSuccess(data: [Items]) {
        print("success")
        self.model = data
        for each in self.model {
            for eachCam in each.cameras ?? [] {
                self.nearByPlacesArray.append(eachCam)
            }
        }
        
        showCurrentLocationOnMap()
        
    }
    
    func getMapValuesFailed(message: String) {
        print(message)
    }
    
}
