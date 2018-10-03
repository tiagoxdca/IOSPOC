//
//  HomeScreenViewController.swift
//  IOSPOC
//
//  Created by Tiago Almeida on 13/09/2018.
//  Copyright © 2018 Tiago Almeida. All rights reserved.
//

import UIKit
import Crashlytics
import Firebase
import FirebaseAnalytics



class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var lbMessage: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Analytics.logEvent("enter_home_Screen", parameters: ["name_viewController": self.description])

//        let message = Message()
//        lbMessage.text = message.content
//        createButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func createButton() {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.setTitle("Crash", for: [])
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        Crashlytics.sharedInstance().crash()
    }
    
    
    @IBAction func btSendMessage(_ sender: Any) {
        Analytics.logEvent("send_message", parameters: nil)
        if tfMessage.text!.count > 2 {
            self.showTextTypedIntoLabel(message: self.tfMessage.text!)
        } else {
            self.showTextTypedIntoLabel(message: nil)
        }
        
    }
    
    func showTextTypedIntoLabel(message: String?) {
        self.lbMessage.text = message!
    }
    

}


extension HomeScreenViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        Analytics.logEvent("start_inserting_text", parameters: ["name_viewController": HomeScreenViewController.self.description()])
            fatalError()
    }
}
