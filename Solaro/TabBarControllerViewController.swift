//
//  TabBarControllerViewController.swift
//  Solaro
//
//  Created by Nikolai Dunkel on 23.06.17.
//  Copyright © 2017 Nikolai Dunkel. All rights reserved.
//

import UIKit

class TabBarControllerViewController: UITabBarController {

    var loggedIn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        if (loggedIn == false){
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
