//
//  ViewController.swift
//  keyword
//
//  Created by Student on 01/04/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var outltsli: UISlider!
    
    @IBAction func sliout(_ sender: Any) {
        img.alpha = CGFloat(outltsli.value)
    }
    
    func textFieldShouldReturn(){
        
    }
}

