
import UIKit

class ImageCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: GalleryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
    }
    
}

extension ImageCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as! GalleryCollectionViewCell
        print("in cell...")
        cell.textLabel.text = GalleryCollectionViewCell.identifier
        return cell
    }
    
    
}



