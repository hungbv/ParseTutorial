//
//  HomeViewController.swift
//  ParseTutorial
//
//  Created by hungbv on 9/22/15.
//  Copyright © 2015 hungbv. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    @IBOutlet weak var helloUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (PFUser.currentUser() == nil) {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.performSegueWithIdentifier("HomeToLoginSegue", sender: self)
            })
        } else if let pUserName = PFUser.currentUser()?["username"] as? String {
            self.helloUserLabel.text = "Hello " + pUserName
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutButtonClicked(sender: AnyObject) {
        PFUser.logOut()
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.performSegueWithIdentifier("HomeToLoginSegue", sender: self)
        })
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
