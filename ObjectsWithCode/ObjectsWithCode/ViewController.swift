import UIKit

class ViewController: UIViewController {
    
    //var myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        let myLabel = UILabel()
        myLabel.text = "My Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width * 0.1, y: height * 0.3, width: width * 0.8, height: 50)
        view.addSubview(myLabel)
        
        let myButton = UIButton()
        myButton.setTitle("My Button", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.systemBlue, for: UIControl.State.normal)
        myButton.titleLabel?.textAlignment = .center
        myButton.frame = CGRect(x: width * 0.33, y: height * 0.3 + 50, width: width * 0.34, height: 50)
        myButton.addTarget(self, action: #selector(myButtonClicked), for: UIControl.Event.touchUpInside)
        view.addSubview(myButton)
    }
    
    @objc func myButtonClicked() {
        print("Button Clicked")
    }

}
