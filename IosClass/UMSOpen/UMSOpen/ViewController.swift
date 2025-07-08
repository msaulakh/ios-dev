//
//  ViewController.swift
//  UMSOpen
//
//  Created by Student on 29/04/25.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Open the link in Safari
            if let url = URL(string: "https://ums.lpu.in") {
                UIApplication.shared.open(url)
            }
        }


}

