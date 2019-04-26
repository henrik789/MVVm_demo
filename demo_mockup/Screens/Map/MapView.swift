//import MapKit
//import CoreLocation
//import UIKit
//
//class MapView: UIView{
//
//    @IBOutlet weak var mapView: MKMapView!
//    var locationManager = CLLocationManager()
//
//    static func instanceFromNib() -> MapView {
//        return UINib(nibName: "MapView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MapView
//    }
//
//    override init(frame: CGRect) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        mapView.showsUserLocation = true
//
//    }
//
//    func setupLocationManager() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    }
//
//    func checkLocationServices() {
//        if CLLocationManager.locationServicesEnabled() {
//            setupLocationManager()
//        } else {
//            //Show alert
//        }
//    }
//
//    func checkLocationAuthorization() {
//        switch CLLocationManager.locationServicesEnabled() {
//        case .authorizedWhenInUse:
//            mapView.showsUserLocation = true
//        case .denied:
//            break
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted:
//            break
//        case .denied:
//            break
//        case .authorizedAlways:
//            break
//        }
//    }
//
//}
//
//extension MapView: CLLocationManagerDelegate {
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//    }
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//
//    }
//}
