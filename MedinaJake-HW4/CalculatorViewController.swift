//
//  CalculatorViewController.swift
//  MedinaJake-HW4
//
//  Created by Jake Medina on 9/27/23.
//
//  Project: MedinaJake-HW4
//  EID: jrm7784
//  Course: CS371L

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var operand1Field: UITextField!
    @IBOutlet weak var operand2Field: UITextField!
    
    // set by main VC
    var whichOperator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operand1Field.delegate = self
        operand2Field.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        operatorLabel.text = whichOperator
        super.viewWillAppear(animated)
    }
    
    // Hide keyboard when 'return' key is pressed
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Hide keyboard when user touches elsewhere on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func doIntOperation(num1: Int, num2: Int, op: String) -> String {
        switch op {
        case "+":
            return String(num1 + num2)
        case "-":
            return String(num1 - num2)
        case "*":
            return String(num1 * num2)
        case "/":
            return num2 == 0 ? "divide by 0 error" : String(num1 / num2)
        default:
            return "error: unknown operation"
        }
    }
    
    func doFloatOperation(num1: Float, num2: Float, op: String) -> String {
        switch op {
        case "+":
            return String(num1 + num2)
        case "-":
            return String(num1 - num2)
        case "*":
            return String(num1 * num2)
        case "/":
            return num2 == 0 ? "divide by 0 error" : String(num1 / num2)
        default:
            return "error: unknown operation"
        }
    }

    @IBAction func calculatePressed(_ sender: Any) {
        // don't calculate unless both operands are defined
        if (!operand1Field.text!.isEmpty && !operand2Field.text!.isEmpty) {
            // if both operands are integers
            if (Int(operand1Field.text!) != nil && Int(operand2Field.text!) != nil) {
                // result should be Int
                let operand1 = Int(operand1Field.text!)!
                let operand2 = Int(operand2Field.text!)!
                resultLabel.text = doIntOperation(num1: operand1, num2: operand2, op: whichOperator)
            } else if (Float(operand1Field.text!) != nil && Float(operand2Field.text!) != nil){
                // result should be Float
                let operand1 = Float(operand1Field.text!)!
                let operand2 = Float(operand2Field.text!)!
                resultLabel.text = doFloatOperation(num1: operand1, num2: operand2, op: whichOperator)
            } else {
                // one or both of the values is not a number
                resultLabel.text = "Invalid operand(s)."
            }
        }
    }
    
}
