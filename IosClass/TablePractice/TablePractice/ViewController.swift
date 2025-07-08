//
//  ViewController.swift
//  TablePractice
//
//  Created by Student on 08/04/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tb: UITableView!
    
    
    var names = ["Aman", "Jass", "Shiv", "Junior"]
    var images = [UIImage(named: "aman"), UIImage(named: "jass"), UIImage(named: "Shiv"), UIImage(named: "junior")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = tb.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        
        obj.textLabel?.text = names[indexPath.row]
        
        return obj
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 3){
            view.backgroundColor = .green
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> UITableViewCell {
        Obj = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
}
