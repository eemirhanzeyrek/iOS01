import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageLabel: UILabel!
    
    var selectedImageLabel = ""
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageLabel.text = selectedImageLabel
        imageView.image = selectedImage
    }

}
