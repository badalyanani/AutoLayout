//
//  ViewController.swift
//  AutoLayoutHomework
//
//  Created by Ani on 10/20/19.
//  Copyright © 2019 Ani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func onTap(_ sender: Any) {
        let kim = User(name: "Kim", surname: "Kardashian", image: "kim")
               
        let userProfile = UserViewController(user: kim)
               navigationController?.pushViewController(userProfile, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

