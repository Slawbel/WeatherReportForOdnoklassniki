import UIKit
import MapKit
import CoreLocation

class MapSettings {
    
    var locationManager = CLLocationManager()
    private let areaZoomSize: Double = 1000
    private var directionsArray: [MKDirections] = []
    private var placeCoordinate: CLLocationCoordinate2D?
    
    func setPlace(map: MKMapView, place: (name: String, type: String, location: String)) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(place.location) { [weak self] (placemarks, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let placemarks = placemarks, let placemark = placemarks.first else { return }
            let annotation = MKPointAnnotation()
            annotation.title = place.name
            annotation.subtitle = place.type
            
            guard let placemarkLocation = placemark.location else { return }
            annotation.coordinate = placemarkLocation.coordinate
            self?.placeCoordinate = placemarkLocation.coordinate
            map.showAnnotations([annotation], animated: true)
            map.selectAnnotation(annotation, animated: true)
        }
    }
    
    func checkLocationAuthorization(map: MKMapView) {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            map.showsUserLocation = true
        case .denied:
            showAlert(title: "Access Denied", message: "To permit access: Settings -> 'This app' -> Location")
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            showAlert(title: "Location Restricted", message: "Location access is restricted.")
        @unknown default:
            break
        }
    }
    
    @objc func showUserLocation(map: MKMapView) {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: areaZoomSize, longitudinalMeters: areaZoomSize)
            map.setRegion(region, animated: true)
        } else {
            showAlert(title: "Location Not Available", message: "Unable to get the current location.")
        }
    }
    
    func getDirections(from currentLocation: CLLocation, to destinationCoordinate: CLLocationCoordinate2D, map: MKMapView) {
        let startLocation = MKPlacemark(coordinate: currentLocation.coordinate)
        let destination = MKPlacemark(coordinate: destinationCoordinate)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startLocation)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .automobile
        request.requestsAlternateRoutes = true
        
        let directions = MKDirections(request: request)
        
        // Remove any existing overlays
        map.removeOverlays(map.overlays)
        
        directions.calculate { [weak self] (response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    self?.showAlert(title: "Error", message: error.localizedDescription)
                    return
                }
                guard let response = response else {
                    self?.showAlert(title: "Error", message: "Directions not available")
                    return
                }
                
                // Add route overlays
                for route in response.routes {
                    map.addOverlay(route.polyline)
                    map.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                }
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            print("No connected window scene found")
            return
        }
        
        let alertWindow = UIWindow(windowScene: windowScene)
        alertWindow.frame = windowScene.coordinateSpace.bounds
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindow.Level.alert + 1
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alertController, animated: true)
    }
}
