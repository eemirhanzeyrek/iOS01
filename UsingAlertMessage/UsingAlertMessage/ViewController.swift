import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        if usernameTextField.text == "" {
            makeAlertMessage(titleInput: "Error", messageInput: "Please enter your username.")
        } else if passwordTextField.text == "" {
            makeAlertMessage(titleInput: "Error", messageInput: "Please enter your password.")
        } else if passwordTextField.text != passwordAgainTextField.text {
            makeAlertMessage(titleInput: "Error", messageInput: "Your passwords do not match.")
        } else {
            makeAlertMessage(titleInput: "Success", messageInput: "User created.")
        }
    }
    
    func makeAlertMessage(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
