//
//  ViewController.swift
//  StudentMarksCalculatorApp
//
//  Created by Student on 17/03/25.
//
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var subject1TextField: UITextField!
    @IBOutlet weak var subject2TextField: UITextField!
    @IBOutlet weak var subject3TextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculateMarks(_ sender: UIButton) {
        guard let text1 = subject1TextField.text, !text1.isEmpty,
              let text2 = subject2TextField.text, !text2.isEmpty,
              let text3 = subject3TextField.text, !text3.isEmpty,
              let subject1 = Int(text1),
              let subject2 = Int(text2),
              let subject3 = Int(text3) else {
            resultLabel.text = "Please enter valid marks for all subjects!"
            return
        }
        
        let totalMarks = subject1 + subject2 + subject3
        let percentage = Double(totalMarks) / 3.0
        
        resultLabel.text = "Total: \(totalMarks) | Percentage: \(String(format: "%.2f", percentage))%"
    }
}

