//
//  SignupViewControllerTwo.swift
//  Solaro
//
//  Created by Nikolai Dunkel on 23.06.17.
//  Copyright © 2017 Nikolai Dunkel. All rights reserved.
//

import UIKit

class SignupViewControllerTwo: UIViewController {

    @IBOutlet weak var confirmationCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        confirmationCode.becomeFirstResponder()
    }

    @IBAction func textChanged(_ sender: UITextField) {
        if(confirmationCode.text!.characters.count == 4){
            self.performSegue(withIdentifier: "goBackToTabs", sender: self)
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
                // get a reference to the second view controller
                let tabBarController = segue.destination as! TabBarControllerViewController
        
                // set a variable in the second view controller with the String to pass
                tabBarController.loggedIn = true
        
            }

        
}
