import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedTitle = UserDefaults.standard.object(forKey: "title")
        let storedNote = UserDefaults.standard.object(forKey: "note")
        
        if let newTitle = storedTitle as? String {
            titleLabel.text = "Title: \(newTitle)"
        }
        
        if let newNote = storedNote as? String {
            noteLabel.text = "Note: \(newNote)"
        }
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        UserDefaults.standard.set(titleTextField.text!, forKey: "title")
        UserDefaults.standard.set(noteTextField.text!, forKey: "note")
        
        //UserDefaults.standard.synchronize()
        
        titleLabel.text = "Title: \(titleTextField.text!)"
        noteLabel.text = "Note: \(noteTextField.text!)"
    }
    
    
    @IBAction func clearButtonClicked(_ sender: Any) {
        let storedTitle = UserDefaults.standard.object(forKey: "title")
        let storedNote = UserDefaults.standard.object(forKey: "note")
        
        if (storedTitle as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "title")
            titleLabel.text = "Title: "
        }
        
        if (storedNote as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "note")
            noteLabel.text = "Note: "
        }
    }

}
