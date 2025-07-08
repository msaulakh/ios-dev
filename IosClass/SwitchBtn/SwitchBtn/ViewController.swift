//
//  ViewController.swift
//  SwitchBtn
//
//  Created by Student on 13/03/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var SwitchLabel: UISwitch!
    @IBOutlet weak var FoodLabel: UILabel!
    
    @IBAction func SwitchBtn(_ sender: Any) {
        
        if SwitchLabel.isOn {
            FoodLabel.text = "Veg Mode !"
            FoodLabel.textColor = UIColor.green
        }else{
            FoodLabel.text = "Mix Mode !"
            FoodLabel.textColor = UIColor.black
        }
    }
    
    @IBOutlet weak var seg: UISegmentedControl!
    
    @IBOutlet weak var ff: UILabel!
    
    @IBAction func Segments(_ sender: Any) {
        if seg.selectedSegmentIndex == 0{
            if SwitchLabel.isOn {
                ff.text = "VEgge only"
            }else{
                ff.text = "Alomate and veege"
            }
        }
        if seg.selectedSegmentIndex == 1{
            if SwitchLabel.isOn {
                ff.text = "DAL"
            }else{
                ff.text = "Chiken and Dal"
            }
        }
        if seg.selectedSegmentIndex == 2{
            if SwitchLabel.isOn {
                ff.text = "Panner"
            }else{
                ff.text = "Fish and Roti"
            }
        }
    }
    
}

