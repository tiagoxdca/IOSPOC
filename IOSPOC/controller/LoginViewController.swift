//
//  LoginViewController.swift
//  IOSPOC
//
//  Created by Tiago Almeida on 13/09/2018.
//  Copyright © 2018 Tiago Almeida. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAnalytics

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goToHomeScreen(_ sender: Any) {
        
        
        
        
        Auth.auth().signIn(withEmail: tfEmail.text!, password: tfPassword.text!) { (user, error) in
            if error != nil {
                Analytics.logEvent("invalid_credentials_signIn", parameters: ["tfUserName": "username_field_invalid"])
                Analytics.logEvent("invalid_credentials_signIn", parameters: ["tfPassword": "password_field_invalid"])
                self.showErrorMessage()
            } else{
                
                Analytics.logEvent(AnalyticsEventLogin, parameters: nil)
                self.performSegue(withIdentifier: "loginToHomeScreen", sender: self)
            }
        }
        
    }
    
    func showErrorMessage(){
        let alertController = UIAlertController(title: "Error Message", message: "Your credentials are wrong...", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
            self.view.endEditing(true)
    }
    

}
