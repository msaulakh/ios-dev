//
//  ViewController.swift
//  TableViewsss
//
//  Created by Student on 29/04/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items = ["hdfc", "pnb","sbi"]
    var images = ["hdfc_icon", "pnb_icon", "sbi_icon"] // Array of image names

    @IBOutlet weak var tb: UITableView!
    @IBOutlet weak var img: UIImageView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let c = tb.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        c.textLabel?.text = items[indexPath.row]
        
        return c
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Get the corresponding image name from the images array
            let selectedImageName = images[indexPath.row]
            
            // Set the image in the UIImageView
            img.image = UIImage(named: selectedImageName)
            
            // Deselect the row immediately after selection
            tableView.deselectRow(at: indexPath, animated: true)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

