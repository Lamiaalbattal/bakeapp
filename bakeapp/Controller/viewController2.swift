//
//  viewController2.swift
//  bakeapp
//
//  Created by Maryam on 28/08/1444 AH.
//

import UIKit

class viewController2: UIViewController , UITextFieldDelegate {
    
//    @IBOutlet weak var LBTitle: UILabel!
//
//    @IBOutlet weak var LBEmaail: UILabel!
//
//    @IBOutlet weak var TextEmail: UITextField!
//
//    @IBOutlet weak var LBPassword: UILabel!
//
//
//    @IBOutlet weak var TextPassword: UITextField!
    
    @IBOutlet weak var LBTitle: UILabel!
    
    @IBOutlet weak var LBEmaail: UILabel!
    
    
    @IBOutlet weak var TextEmail: UITextField!
    
    @IBOutlet weak var LBPassword: UILabel!
    
    
    @IBOutlet weak var TextPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextEmail.delegate = self
        TextPassword.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func ButtonSignIn(_ sender: Any) {
        do{
        try SignIn()
    }catch{
        print("error: \(error)")
               }

    }
   
    func SignIn() throws {
        let email = TextEmail.text!
        let password = TextPassword.text!
        if !email.isValidEmail{
            throw SignInError.isValidEmail
        }
        if !password.isValidPassword{
            throw SignInError.isValidPassword
        }
    }
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == TextEmail{
            TextPassword.becomeFirstResponder()
        }else{
            
            view.endEditing(true)
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


extension String {
    var isValidEmail : Bool {
        let format = "^[_A-Za-z0-9-\\+]+\\.[_A-Za-z0-9-]+@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@" , format)
        return predicate.evaluate(with: self)
    }
    var isValidPassword : Bool{
        return self.count > 7
    }
}
enum SignInError : Error{
    case isValidEmail
    case isValidPassword
}
