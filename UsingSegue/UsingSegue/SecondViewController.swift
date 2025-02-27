import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var myTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = myTitle
    }
    
}
