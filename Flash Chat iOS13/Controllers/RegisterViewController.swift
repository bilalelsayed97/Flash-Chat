import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
//        if let email = emailTextfield.text, let password = passwordTextfield.text {
//            createNewUser(email, password)
//        }
    }
    
    func createNewUser (_ email: String, _ password: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
            }
            
        }
        
    }
}
