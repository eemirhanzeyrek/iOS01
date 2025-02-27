import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var data1Label: UILabel!
    @IBOutlet weak var data2Label: UILabel!
    @IBOutlet weak var data3Label: UILabel!
    @IBOutlet weak var data4Label: UILabel!
    @IBOutlet weak var data5Label: UILabel!
    @IBOutlet weak var data6Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getDataButtonClicked(_ sender: Any) {
        // 1) Request - Session
        let url = URL(string: "url")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                self.makeAlertMessage(titleInput: "Error", messageInput: error?.localizedDescription ?? "Unknown Error")
            } else {
                // 2) Response - Data
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        // 3) Parsing - JSON Serialization
                        DispatchQueue.main.async {
                            if let datas = jsonResponse["datas"] as? [String : Any] {
                                
                                if let data1 = datas["data1"] as? Double {
                                    self.data1Label.text = "Data1: \(data1)"
                                }
                                
                                if let data2 = datas["data2"] as? Double {
                                    self.data2Label.text = "Data2: \(data2)"
                                }
                                
                                if let data3 = datas["data3"] as? Double {
                                    self.data3Label.text = "Data3: \(data3)"
                                }
                                
                                if let data4 = datas["data4"] as? Double {
                                    self.data4Label.text = "Data4: \(data4)"
                                }
                                
                                if let data5 = datas["data5"] as? Double {
                                    self.data5Label.text = "Data5: \(data5)"
                                }
                                
                                if let data6 = datas["data6"] as? Double {
                                    self.data6Label.text = "Data6: \(data6)"
                                }
                                
                            }
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }
        task.resume()
    }
    
    func makeAlertMessage(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

}
