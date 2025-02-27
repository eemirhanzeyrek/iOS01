import UIKit

class ViewController: UIViewController {
    
    var userTitle = ""
    
    @IBOutlet weak var myFirstLabel: UILabel!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad function called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear function called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear function called")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear function called")
        
        titleTextField.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewdidAppear function called")
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        userTitle = titleTextField.text!
        
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            
            destinationVC.myTitle = userTitle
        }
    }
    
}
