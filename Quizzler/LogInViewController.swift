//
//  LogInViewController.swift
//  Quizzler
//
//  Created by Republisys on 19/04/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD


class LogInViewController: UIViewController {
    
    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func logInPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        //TODO: Log in the user
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print(error!)
                SVProgressHUD.dismiss()
                ProgressHUD.showError("Login Error")
                //self.performSegue(withIdentifier: "goToRoot1", sender: self)
            } else {
                print("Login successful!")
                SVProgressHUD.dismiss()
                ProgressHUD.showSuccess("Login successful!")
                self.performSegue(withIdentifier: "goToMenu1", sender: self)
            }
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToRoot1", sender: self)
    }
    
    
    
} 
