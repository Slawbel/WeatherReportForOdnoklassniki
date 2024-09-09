import UIKit
import MapKit
import CoreLocation

protocol MapViewControllerDelegate: AnyObject {
    func didSelectCity(_ city: String)
}

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    let map = MKMapView()
    let closeButton = UIButton()
    let userLocationButton = UIButton()
    let pinView = UIImageView()
    let addressLabel = UILabel()
    let buttonDone = UIButton()

    var delegate: MapViewControllerDelegate?
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        
        setupMapView()
        setupLocationManager()
        setupCloseButtonView()
        setupUserLocationButtonView()
        setupPinView()
        setupAddressLabel()
        setupButtonDone()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(mapTapped(_:)))
        map.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupMapView() {
        view.addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: view.topAnchor),
            map.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            map.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            map.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        map.isScrollEnabled = true
        map.isZoomEnabled = true
        map.mapType = .standard
        map.showsUserLocation = true
    }
    
    private func setupCloseButtonView() {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 25),
            closeButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        closeButton.setImage(UIImage(named: "cancelMap"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeMap), for: .touchUpInside)
    }
    
    private func setupUserLocationButtonView() {
        view.addSubview(userLocationButton)
        userLocationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userLocationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userLocationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            userLocationButton.widthAnchor.constraint(equalToConstant: 50),
            userLocationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        userLocationButton.setImage(UIImage(named: "userLocation"), for: .normal)
        userLocationButton.addTarget(self, action: #selector(showUserLocation), for: .touchUpInside)
    }
    
    private func setupPinView() {
        view.addSubview(pinView)
        pinView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pinView.widthAnchor.constraint(equalToConstant: 50),
            pinView.heightAnchor.constraint(equalToConstant: 50),
            pinView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pinView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20)
        ])
        
        pinView.image = UIImage(named: "pin")
        pinView.contentMode = .scaleAspectFit
    }
    
    private func setupAddressLabel() {
        view.addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressLabel.heightAnchor.constraint(equalToConstant: 36),
            addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addressLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        ])
        
        addressLabel.text = ""
        addressLabel.font = UIFont.systemFont(ofSize: 18)
        addressLabel.backgroundColor = .clear
        addressLabel.textAlignment = .center
    }
    
    private func setupButtonDone() {
        view.addSubview(buttonDone)
        buttonDone.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonDone.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            buttonDone.widthAnchor.constraint(equalToConstant: 120),
            buttonDone.heightAnchor.constraint(equalToConstant: 50),
            buttonDone.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        buttonDone.setTitle("Done", for: .normal)
        buttonDone.setTitleColor(.black, for: .normal)
        buttonDone.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        buttonDone.backgroundColor = .clear
        buttonDone.addTarget(self, action: #selector(chooseAddress), for: .touchUpInside)
    }
    
    @objc private func mapTapped(_ sender: UITapGestureRecognizer) {
        let touchPoint = sender.location(in: map)
        let touchCoordinate = map.convert(touchPoint, toCoordinateFrom: map)
        placePin(at: touchCoordinate)
        getCityName(for: touchCoordinate) { [weak self] cityName in
            self?.addressLabel.text = cityName
        }
    }
    
    private func placePin(at coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Selected Location"
        map.removeAnnotations(map.annotations)
        map.addAnnotation(annotation)
        map.selectAnnotation(annotation, animated: true)
    }
    
    private func getCityName(for coordinate: CLLocationCoordinate2D, completion: @escaping (String) -> ()) {
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first else {
                completion("")
                return
            }
            
            let city = placemark.locality ?? ""
            completion(city)
        }
    }

    @objc private func chooseAddress() {
        if let cityName = addressLabel.text {
            delegate?.didSelectCity(cityName)
        }
        closeMap()
    }
    
    @objc private func closeMap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    @objc private func showUserLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            if let location = locationManager.location {
                map.setCenter(location.coordinate, animated: true)
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let routeOverlay = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routeOverlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 4.0
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
