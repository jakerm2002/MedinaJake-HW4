//
//  ViewController.swift
//  MedinaJake-HW4
//
//  Created by Jake Medina on 9/26/23.
//
//  Project: MedinaJake-HW4
//  EID: jrm7784
//  Course: CS371L

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let operations:[String] = ["Add", "Subtract", "Multiply", "Divide"]
    let operationSymbols:[String] = ["+", "-", "*", "/"]
    let textCellIdentifier = "TextCell"
    let calcSegueIdentifier = "CalcSegueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type.
       let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        
       // Configure the cell’s contents.
        cell.textLabel!.text = operations[indexPath.row]
           
       return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == calcSegueIdentifier,
           let destination = segue.destination as? CalculatorViewController,
           let operationIndex = tableView.indexPathForSelectedRow?.row
        {
            // send the correct operator symbol to the CalcVC
            destination.whichOperator = operationSymbols[operationIndex]
        }
    }

}

