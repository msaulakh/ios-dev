//
//  NextViewController.swift
//  praticeOnboradingScreen
//
//  Created by Student on 22/04/25.
//

import Foundation
import UIKit


var interstRate: Double = 0.0

class NextViewController: UIViewController {
    
    
    @IBOutlet weak var hdfcButton: UIButton!
    @IBOutlet weak var pnbButton: UIButton!
    @IBOutlet weak var sbiButton: UIButton!
    @IBOutlet weak var axisButton: UIButton!
    
    // 1. Segmented Control for Loan Type
    let loanTypeSegment: UISegmentedControl = {
        let items = ["Car", "Personal", "Home"]
        let segment = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 0
        segment.backgroundColor = .white
        segment.selectedSegmentTintColor = .systemBlue
        segment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segment.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        return segment
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        
        // 2. Add segment to view
        view.addSubview(loanTypeSegment)
        loanTypeSegment.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Set up button images and title alignment
              setupButtonImagesAndTitles()
        
        NSLayoutConstraint.activate([
            loanTypeSegment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            loanTypeSegment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loanTypeSegment.widthAnchor.constraint(equalToConstant: 300),
            loanTypeSegment.heightAnchor.constraint(equalToConstant: 40)
        ])

    }
   
    func setupButtonImagesAndTitles() {
        configure(button: hdfcButton, imageName: "hdfc_icon", title: "HDFC")
        configure(button: pnbButton, imageName: "pnb_icon", title: "PNB")
        configure(button: sbiButton, imageName: "sbi_icon", title: "SBI")
        configure(button: axisButton, imageName: "axis_icon", title: "AXIS")
    }

    func configure(button: UIButton, imageName: String, title: String) {
        if let image = UIImage(named: imageName) {
            let resizedImage = resizeImage(image: image, targetSize: CGSize(width: 50, height: 50))
            button.setImage(resizedImage, for: .normal)
        }
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black

        // Padding between image and title
       
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)

        
        // Ensure content alignment is correct
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .center
    }

    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }

        
        @IBAction func btnTap(_ sender: UIButton) {
            guard let bank = sender.titleLabel?.text else { return }
            
            // Get selected loan type
            let selectedSegmentIndex = loanTypeSegment.selectedSegmentIndex
            let loanType = loanTypeSegment.titleForSegment(at: selectedSegmentIndex) ?? "Unknown"
            
            // Set interest rate based on bank and loan type
            switch bank {
            case "HDFC":
                switch loanType {
                case "Car": interstRate = 7.1
                case "Personal": interstRate = 10.5
                case "Home": interstRate = 8.4
                default: interstRate = 0.0
                }
            case "SBI":
                switch loanType {
                case "Car": interstRate = 6.9
                case "Personal": interstRate = 9.8
                case "Home": interstRate = 7.3
                default: interstRate = 0.0
                }
            case "PNB":
                switch loanType {
                case "Car": interstRate = 7.8
                case "Personal": interstRate = 11.2
                case "Home": interstRate = 8.7
                default: interstRate = 0.0
                }
            case "AXIS":
                switch loanType {
                case "Car": interstRate = 7.5
                case "Personal": interstRate = 10.9
                case "Home": interstRate = 8.0
                default: interstRate = 0.0
                }
            default:
                interstRate = 0.0
            }
            
            if let vc = storyboard?.instantiateViewController(withIdentifier: "CalcVC") as? CalcViewController {
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
            }
            
        }
    }
