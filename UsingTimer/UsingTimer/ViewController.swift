import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 15
        
        timeLabel.text = "\(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction() {
        timeLabel.text = "\(counter)"
        
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            
            timeLabel.text = "Time's Up!"
        }
    }
    
    @IBAction func startButtonClicked(_ sender: Any) {
        print("Start Button Clicked")
    }
    
}
