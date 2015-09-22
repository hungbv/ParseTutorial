//
//  ResetPasswordViewController.swift
//  ParseTutorial
//
//  Created by hungbv on 9/22/15.
//  Copyright © 2015 hungbv. All rights reserved.
//

import UIKit
import Parse

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onResetPasswordClicked(sender: AnyObject) {
        let email = emailTextField.text
        let finalEmail = email!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        PFUser.requestPasswordResetForEmailInBackground(finalEmail)
        
        let alert = UIAlertView(title: "Password Reset", message: "An email containing information on how to reset your password has been sent to " + finalEmail + ".", delegate: self, cancelButtonTitle: "OK")
        alert.show()
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
