import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInButtonClicked(_ sender: Any) {
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Confirm that it's really you?") { (success, error) in
                if success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Authentication failed"
                    }
                }
            }
        }
    }
    
}
