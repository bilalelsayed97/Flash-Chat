import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func signOut(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let e as NSError {
            print(e)
        }
    }
    
}
