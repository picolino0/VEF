//
//  ViewController.swift
//  VEF
//
//  Created by Colin Rosen on 12/9/15.
//  Copyright © 2015 Colin Rosen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var yourName: UITextField!
    @IBOutlet weak var roomCode: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bind keyboard show/hide listeners
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    // Resign first responder status when return key is pressed
    @IBAction func textFieldReturn(sender: UITextField) {
        sender.resignFirstResponder()
        
        if sender.tag == 1 {
            roomCode.becomeFirstResponder()
        }
    }
    
    // Check if both textfields contain valid information
    @IBAction func textFieldChange(sender: UITextField) {
        if yourName.text?.characters.count >= 3 && roomCode.text?.characters.count == 6 {
            btnLogin.enabled = true
        } else {
            btnLogin.enabled = false
        }
    }
    
    // Make sure the room code isn't longer than 6 characters
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        
        return newLength <= 6
    }
    
    // Make sure the scrollview will be resized when the keyboard is opened en closed
    func keyboardWillShow(notification:NSNotification){
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        keyboardFrame = self.view.convertRect(keyboardFrame, fromView: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsetsZero
        self.scrollView.contentInset = contentInset
    }
}

