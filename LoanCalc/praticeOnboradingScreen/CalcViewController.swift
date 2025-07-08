//
//  CalcViewController.swift
//  praticeOnboradingScreen
//
//  Created by Student on 15/04/25.
//

import UIKit
import DGCharts

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

class CalcViewController: UIViewController {
    
    @IBOutlet weak var amt: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var interst: UITextField!
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interst.text = "\(interstRate)"
        interst.isUserInteractionEnabled = false // only read
        result.text = "₹"
        
        setupPieChart()
    }
    
    // MARK: - Setup UI Elements
    func setupUI() {
        // Customizing text fields for a cleaner look
        amt.layer.cornerRadius = 10
        amt.layer.borderWidth = 1
        amt.layer.borderColor = UIColor.systemGray.cgColor
        amt.placeholder = "Enter Loan Amount"
        
        time.layer.cornerRadius = 10
        time.layer.borderWidth = 1
        time.layer.borderColor = UIColor.systemGray.cgColor
        time.placeholder = "Enter Loan Duration (Years)"
        
        // Customizing result label
        result.font = UIFont.boldSystemFont(ofSize: 20)
        result.textColor = .systemGreen
    }
    
    // MARK: - Set up Pie Chart
    func setupPieChart() {
        pieChartView.usePercentValuesEnabled = true
           pieChartView.drawEntryLabelsEnabled = false
           pieChartView.holeColor = .clear
           pieChartView.transparentCircleColor = .clear
           
           // Custom hole and center text
           pieChartView.drawHoleEnabled = true
           pieChartView.holeRadiusPercent = 0.45
           pieChartView.transparentCircleRadiusPercent = 0.46
           pieChartView.holeColor = UIColor.systemBackground
           
           // Rotation and animation
           pieChartView.rotationEnabled = true
           pieChartView.rotationAngle = 0
           pieChartView.highlightPerTapEnabled = true
           
           // Legend customization
           let legend = pieChartView.legend
           legend.horizontalAlignment = .right
           legend.verticalAlignment = .center
           legend.orientation = .vertical
           legend.drawInside = false
           legend.xEntrySpace = 7
           legend.yEntrySpace = 5
           legend.yOffset = 0
           legend.font = UIFont.systemFont(ofSize: 12, weight: .medium)
           legend.textColor = .label
           
           // Entry label styling
           pieChartView.entryLabelColor = .white
           pieChartView.entryLabelFont = UIFont.systemFont(ofSize: 12, weight: .bold)
           
           // No description
           pieChartView.chartDescription.enabled = false
    }
    
    @IBAction func emicalc(_ sender: Any) {
        guard let amountValue = Double(amt.text ?? ""),
              let timeValue = Double(time.text ?? "") else {
            result.text = "Please enter valid numbers.."
            result.textColor = .systemRed
            return
        }
        
        let months = timeValue * 12
        let monthRate = interstRate / 100 / 12
        let emi = (amountValue * monthRate * pow(1 + monthRate, months)) / (pow(1 + monthRate, months) - 1)
        
        result.text = String(format: "Monthly EMI: ₹ %.2f", emi)
        result.font = UIFont.boldSystemFont(ofSize: 20)
        result.textColor = .systemRed
        
        // Prepare data for the pie chart
        updatePieChart(principal: amountValue, emi: emi, months: months)
    }
    
    // MARK: - Pie Chart Data Update
    func updatePieChart(principal: Double, emi: Double, months: Double) {
        let totalPaid = (emi * months).rounded(toPlaces: 2)
            let interestPaid = (totalPaid - principal).rounded(toPlaces: 2)
            let roundedPrincipal = principal.rounded(toPlaces: 2)
            
            // Data entries with 2 decimal precision
            let dataEntries = [
                PieChartDataEntry(value: roundedPrincipal, label: "Principal"),
                PieChartDataEntry(value: interestPaid, label: "Interest")
            ]
            
            // Data set configuration
            let dataSet = PieChartDataSet(entries: dataEntries, label: "")
            dataSet.colors = [
                UIColor(red: 0.20, green: 0.60, blue: 0.86, alpha: 1.00),
                UIColor(red: 0.91, green: 0.30, blue: 0.24, alpha: 1.00)
            ]
            
            // Custom value formatter for percentage with 2 decimal places
            let valueFormatter = DefaultValueFormatter { (value, entry, dataSetIndex, viewPortHandler) -> String in
                // Calculate percentage of total
                let total = dataEntries.reduce(0) { $0 + $1.value }
                let percentage = (value / total) * 100
                return String(format: "%.2f%%", percentage)
            }
            
            dataSet.valueFormatter = valueFormatter
            dataSet.valueTextColor = .black // Black color for slice values
            dataSet.valueFont = UIFont.systemFont(ofSize: 12, weight: .bold)
            
            // Slice styling
            dataSet.sliceSpace = 2.0
            dataSet.selectionShift = 5
            dataSet.xValuePosition = .outsideSlice
            dataSet.yValuePosition = .insideSlice
            dataSet.valueLineColor = .darkGray
            dataSet.valueLineWidth = 1
            
            // Apply data to chart
            let data = PieChartData(dataSet: dataSet)
            pieChartView.data = data
            
            // Center text configuration
            let centerText = NSMutableAttributedString(string: "Interest\n", attributes: [
                .font: UIFont.systemFont(ofSize: 16, weight: .medium),
                .foregroundColor: UIColor.darkGray
            ])
            
            let totalFormatter = NumberFormatter()
            totalFormatter.numberStyle = .currency
            totalFormatter.minimumFractionDigits = 2
            totalFormatter.maximumFractionDigits = 2
            
            if let totalString = totalFormatter.string(from: NSNumber(value: totalPaid)) {
                centerText.append(NSAttributedString(string: totalString, attributes: [
                    .font: UIFont.systemFont(ofSize: 20,
                                            weight: .bold),
                    .foregroundColor: UIColor.black
                ]))
            }
            
            pieChartView.centerAttributedText = centerText
            pieChartView.animate(xAxisDuration: 1.2, easingOption: .easeOutBack)
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "NextVC") as? NextViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
