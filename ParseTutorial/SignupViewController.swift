//
//  SignupViewController.swift
//  ParseTutorial
//
//  Created by hungbv on 9/22/15.
//  Copyright © 2015 hungbv. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
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
    
    @IBAction func onSignupButtonClicked(sender: AnyObject) {
        let email = emailTextField.text!
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        let finalEmail = email.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if (email.characters.count == 0 || username.characters.count == 0 || password.characters.count == 0) {
            let alert = UIAlertView(title: "Invalid", message: "Please fill all fields to create account", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        } else {
            let newUser = PFUser()
            
            newUser.username = username
            newUser.password = password
            newUser.email = finalEmail
            
            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                if((error) != nil) {
                    let alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                } else {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
                    })
                }
            })
        }
        
    }
    
    @IBAction func onCloseButtonClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
