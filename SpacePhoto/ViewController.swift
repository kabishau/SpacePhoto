import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            self.title = photoInfo?.title
            self.descriptionLabel.text = photoInfo?.description
            if let copyright = photoInfo?.copyright {
                self.copyrightLabel.text = "Copyright \(copyright)"
            } else {
                self.copyrightLabel.isHidden = true
            }
        }
    }
}

