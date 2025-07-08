//
//  ViewController.swift
//  praticeOnboradingScreen
//
//  Created by Student on 15/04/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(startNextVC), userInfo: nil, repeats: false)
        
    }
    
    
    @IBAction func nextbtn(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
              let nextVC = storyBoard.instantiateViewController(withIdentifier: "NextVC")
              nextVC.modalPresentationStyle = .fullScreen
              present(nextVC, animated: true, completion: nil)
    }
    
    
//    @objc func startNextVC(){
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let next = storyBoard.instantiateViewController(withIdentifier: "NextVC")
//        next.modalPresentationStyle = .fullScreen
//        present(next, animated: true, completion: nil)
//    }


}

