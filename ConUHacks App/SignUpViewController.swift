//
//  SignUpViewController.swift
//  ConUHacks App
//
//  Created by Anthony Fiorito on 2016-01-23.
//  Copyright © 2016 ConUHacks. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func signIn(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func signUp(sender: AnyObject) {
        
        if username.text == "" || password.text == "" {
            
            displayAlert("Error in form", message:  "Please enter a username and a password")
            
        } else {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            var user = PFUser()
            user.username = username.text
            user.password = password.text
            
            var errorMessage = "Please try again later"
            
            user.signUpInBackgroundWithBlock({ (success, error) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if error == nil {
                    
                    PFUser.logInWithUsernameInBackground(self.username.text!, password: self.password.text!, block: { (user, error) -> Void in
                        
                        self.activityIndicator.stopAnimating()
                        UIApplication.sharedApplication().endIgnoringInteractionEvents()
                        
                        var errorMessage = ""
                        if user != nil {
                            
                        }
                            
                        else {
                            
                            if let errorString = error!.userInfo["error"] as? String {
                                
                                errorMessage = errorString
                                
                                
                            }
                            self.username.text = ""
                            self.password.text = ""
                            
                            self.displayAlert("Failed SignUp", message: errorMessage)
                            
                            
                        }
                        
                    })

                    
                    
                    
                    self.performSegueWithIdentifier("login", sender: self)
                    
                }
                else {
                    
                    if let errorString = error!.userInfo["error"] as? String {
                        
                        errorMessage = errorString
                        
                        
                    }
                    self.username.text = ""
                    self.password.text = ""

                    self.displayAlert("Failed SignUp", message: errorMessage)
                    
                }
                
                
            })
            
                
            }
        }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        textField.resignFirstResponder()
        
        return  true
    }

}
