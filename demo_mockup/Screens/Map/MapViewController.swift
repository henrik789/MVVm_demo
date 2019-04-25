import MapKit
import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var fxView: UIVisualEffectView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
