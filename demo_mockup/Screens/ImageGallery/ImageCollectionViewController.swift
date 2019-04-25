import  Kingfisher
import UIKit

class ImageCollectionViewController: UIViewController {
    
    let viewModel: ImageCollectionViewModel
    init(viewModel: ImageCollectionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        self.title = viewModel.title
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: GalleryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        viewModel.updateImages { (image) in
            print("success")
        }
    }
    
}

extension ImageCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as! GalleryCollectionViewCell
        cell.textLabel.text = GalleryCollectionViewCell.identifier
        let url = URL(string: "https://picsum.photos/id/\(indexPath.row + 20)/600/600")
        cell.imageView.kf.indicatorType = .activity
        cell.imageView.kf.setImage(with: url)
        return cell
    }
}



