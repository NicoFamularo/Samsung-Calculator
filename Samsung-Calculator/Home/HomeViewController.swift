//
//  HomeViewController.swift
//  Samsung-Calculator
//
//  Created by Nicolas Famularo on 07/01/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
//  MARK:  Outlets
    	
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDec: UIButton!
    @IBOutlet weak var numberMinPlus: UIButton!
    
    @IBOutlet weak var operatorC: UIButton!
    @IBOutlet weak var operatorParen: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorSustration: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorEqual: UIButton!
    
    
//  MARK:   Variables
    
    private var total: Double = 0
    private var temp: Double = 0
    private var operating = false
    private var decimal = false
    private var operation: OperationTypes = .none
    
//  MARK:   Formateadores
    
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.exponentSymbol = "e"
        return formatter
    }()
       
    
    
    
    
//  MARK: Constantes
    
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLength = 9
    private enum OperationTypes{
        case none, addition, subtraction, multiplication, division, percent
    }
    
//  MARK: Button Actions
    
    
    @IBAction func numberAction(_ sender: UIButton) {
        print(sender.tag)
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength{
            return
        }
        
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        if operating {
            total = total == 0 ? temp : temp
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
    }
    
    
    @IBAction func numberDecAction(_ sender: UIButton) {
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength{
            return
        }
        resultLabel.text = resultLabel.text! + kDecimalSeparator
        decimal = true
        sender.shine()
    }
    
    @IBAction func numberMinPlusAction(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    
    @IBAction func operatorCAction(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    
    @IBAction func operatorParenAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        
        if operation != .percent {
            result()
        }
        
        operating = true
        operation = .percent
        result()
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .division
        sender.shine()
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .multiplication
        sender.shine()
    }
    
    @IBAction func operatorSustrationAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .subtraction
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .addition
        sender.shine()
    }
    
    
    @IBAction func operatorEqualAction(_ sender: UIButton) {
        result()
        sender.shine()
    }
    
    
    
//  MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        result()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        numberDec.round()
        numberMinPlus.round()
        
        operatorC.round()
        operatorParen.round()
        operatorEqual.round()
        operatorPercent.round()
        operatorDivision.round()
        operatorAddition.round()
        operatorSustration.round()
        operatorMultiplication.round()
        
        numberDec.setTitle(kDecimalSeparator, for: .normal)
        
    }
    
    private func clear(){
        operation = .none
        operatorC.setTitle("C", for: .normal)
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            
            total = 0
            result()
        }
    }
    
    
    private func result(){
        switch operation {
            
        case .none:
            break
            
        case .addition:
            total = total + temp
            break
            
        case .subtraction:
            total = total - temp
            break
            
        case .multiplication:
            total = total * temp
            break
            
        case .division:
            total = total / temp
            break
            
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
        
        
        
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > kMaxLength {
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        } else {
            
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        
        operation = .none
        
        
        print(total)
               
        
        
    }
    
    
    
    
    
    
    
    
}
