import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "⚡️FlashChat"
//                var index = 0.00
//                titleLabel.text = ""
//                let titleText = "⚡️FlashChat"
//        for letter in titleText {
//            Timer.scheduledTimer(withTimeInterval: (0.12 * index), repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//
//            }
//            index = index + 1
//        }

       
    }
    

}
