//
//  ViewController.swift
//  LoanEmi
//
//  Created by Student on 17/03/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var priOut: UITextField!
    @IBAction func pri(_ sender: Any) {
    }
    
    @IBOutlet weak var rateOut: UITextField!
    @IBAction func rate(_ sender: Any) {

    }
    
    @IBOutlet weak var timeOut: UITextField!
    @IBAction func time(_ sender: Any) {

    }
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func btn(_ sender: Any) {
        guard let ptext = priOut.text, let p = Int(ptext),
              let rtext = rateOut.text, let r = Int(rtext),
              let ttext = timeOut.text, let t = Int(ttext) else{
            result.text = "Enter valid numbers! "
            return
        }

        var res:Int = (p * r * t) / 100
        result.text = "The Amount is: \(res)"
    }
    
}

