//
//  ResultsViewController.swift
//  Solaro
//
//  Created by Nikolai Dunkel on 19.06.17.
//  Copyright © 2017 Nikolai Dunkel. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITextFieldDelegate {
    
    
    var receivedAddress = ""
    var receivedAmount = ""
    var receivedPower = ""
    var receivedPrice = ""
    var quoteRequest: String = ""
    
    var textField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(receivedAddress) would like to order PV equivalent to a monthly bill of \(receivedAmount)")
        
        // segue after 3 seconds
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.performSegue(withIdentifier: "backToTabs", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let tabBarController = segue.destination as! TabBarControllerViewController
//        let nav = tabBarController.viewControllers![1] as! UINavigationController
//        let tableViewController = nav.topViewController as! TableViewController
        
        tabBarController.loggedIn = true
//        tableViewController.mySolarList.append(receivedAddress)
        tabBarController.selectedIndex = 1
        
    }
    
}
