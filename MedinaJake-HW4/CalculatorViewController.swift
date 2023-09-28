//
//  CalculatorViewController.swift
//  MedinaJake-HW4
//
//  Created by Jake Medina on 9/27/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var whichOperator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        operatorLabel.text = whichOperator
        super.viewWillAppear(animated)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func calculatePressed(_ sender: Any) {
    }
}
