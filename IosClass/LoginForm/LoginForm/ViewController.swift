//
//  ViewController.swift
//  LoginForm
//
//  Created by Student on 13/03/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var uname: UITextField!
    @IBOutlet weak var upass: UITextField!
    
    @IBAction func signup(_ sender: Any) {
    }
    
    @IBAction func backBtn(_ sender: Any) {
    }
    
    @IBAction func clear(_ sender: Any) {
        uname.text = ""
        upass.text = ""
    }
    
    
}

