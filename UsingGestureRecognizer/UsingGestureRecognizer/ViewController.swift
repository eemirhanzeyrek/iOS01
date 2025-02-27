import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    var image1 = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func imageTapped() {
        if image1 == true {
            imageView.image = UIImage(named: "image2")
            myLabel.text = "Image 2"
            image1 = false
        } else {
            imageView.image = UIImage(named: "image1")
            myLabel.text = "Image 1"
            image1 = true
        }
    }

}
