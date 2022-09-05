//
//  LoanTableViewController.swift
//  ProjetoStartupFourcamp
//
//  Created by user212293 on 2/17/22.
//

import UIKit

class LoanTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    @IBOutlet weak var loanAvaiableValueLabel: UILabel!
    @IBOutlet weak var loanRequestedValueTextField: UITextField!
    @IBOutlet weak var loanInstallmentsValueUIButton: UIButton!
    @IBOutlet weak var loanPaymentValueUIButton: UIButton!
    
    
    @IBAction func simulateLoanButtonTapped(_ sender: Any) {
        
    }
    
    
    
}
