import MapKit
import CoreLocation
import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var fxView: UIVisualEffectView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
//    override func loadView() {
//        self.view = MapView.instanceFromNib()
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }

    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    var locationManager = CLLocationManager()
    let regionMeters: Double = 10000

    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionMeters, longitudinalMeters: regionMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            //Show alert
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}
