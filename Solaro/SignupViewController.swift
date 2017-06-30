//
//  SignupViewController.swift
//  Solaro
//
//  Created by Nikolai Dunkel on 23.06.17.
//  Copyright © 2017 Nikolai Dunkel. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var phoneNumber: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        phoneNumber.becomeFirstResponder()
    }
    
    
    
    @IBAction func didChange(_ sender: UITextField) {
        if(phoneNumber.text!.characters.count == 10){
            self.performSegue(withIdentifier: "nextPage", sender: self)
        }
    }

}
