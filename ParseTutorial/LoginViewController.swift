//
//  LoginViewController.swift
//  ParseTutorial
//
//  Created by hungbv on 9/22/15.
//  Copyright © 2015 hungbv. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButtonClicked(sender: AnyObject) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        if (username.characters.count == 0 || password.characters.count == 0) {
            let alertView = UIAlertView(title: "Invalid", message: "Please fill all username and password", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        } else {
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user, error) -> Void in
                if ((user) != nil ) {
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    let alert = UIAlertView(title: "Error", message: "\(error)", delegate: nil, cancelButtonTitle: "OK")
                    alert.show()
                }
            })
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
