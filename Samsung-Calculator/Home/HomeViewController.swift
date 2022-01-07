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
    
    
    
//  MARK: Constantes
    
    private let kDecimalSeparator = Locale.current.decimalSeparator
    private let kMaxLength = 9
    private let kMaxValue = 999999999
    private let kMinValue = 0.00000001
    private enum OperationTypes{
        case none, addition, subtraction, multiplication, division, percent
    }
    
//  MARK: Button Actions
    
    
    @IBAction func numberAction(_ sender: UIButton) {
        print(sender.tag)
        sender.shine()
    }
    
    
    @IBAction func numberDecAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func numberMinPlusAction(_ sender: UIButton) {
        sender.shine()
    }
    
    
    @IBAction func operatorCAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorParenAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorSustrationAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorEqualAction(_ sender: UIButton) {
        sender.shine()
    }
    
    
    
//  MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
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
    
}
