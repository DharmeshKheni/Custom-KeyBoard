//
//  ViewController.swift
//  keyBoard
//
//  Created by Anil on 17/01/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

