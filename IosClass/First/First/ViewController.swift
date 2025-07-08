//
//  ViewController.swift
//  First
//
//  Created by Student on 06/03/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Num: UILabel!
    
    @IBAction func Button(_ sender: Any) {
        Label.text = "Welcome to Punjab!"
        
        var n = Num.text
        var result:Int? = Int(n!)
        result = result! + 1
        Num.text = String(result!)
    }
    
    @IBAction func Reg(_ sender: Any) {
    }
    
    @IBAction func Password(_ sender: Any) {
    }
}

