//
//  ViewController.swift
//  Calculator
//
//  Created by Student on 11/03/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var res: UILabel!
    var opr = ""
    var x = 0
    
    
    @IBAction func plus(_ sender: Any) {
        x = Int(res.text!)
        opr = "+"
    }
    
    @IBAction func one(_ sender: Any) {
        res.text = String(1)
    }
    
    @IBAction func two(_ sender: Any) {
    }
    
    @IBAction func three(_ sender: Any) {
    }
    
}

