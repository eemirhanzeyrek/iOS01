import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var imageLabels = [String]()
    var images = [UIImage]()
    
    var chosenImageLabel = ""
    var chosenImage = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        imageLabels.append("image1")
        imageLabels.append("image2")
        imageLabels.append("image3")
        
        images.append(UIImage(named: "image1")!)
        images.append(UIImage(named: "image2")!)
        images.append(UIImage(named: "image3")!)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            imageLabels.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = imageLabels[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageLabels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenImageLabel = imageLabels[indexPath.row]
        chosenImage = images[indexPath.row]
        
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            
            destinationVC.selectedImageLabel = chosenImageLabel
            destinationVC.selectedImage = chosenImage
        }
    }

}
