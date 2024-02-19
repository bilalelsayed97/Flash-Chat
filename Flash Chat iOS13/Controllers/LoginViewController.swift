//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
        //        if let email = emailTextfield.text, let password = passwordTextfield.text {
        //            signIn(email, password)
        //        }
    }
    
    func signIn (_ email: String, _ password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
            }
            
        }
        
    }
    
}
