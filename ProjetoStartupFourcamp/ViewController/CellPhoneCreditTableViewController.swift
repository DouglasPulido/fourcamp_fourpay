//
//  CellPhoneCreditTableViewController.swift
//  ProjetoStartupFourcamp
//
//  Created by user212293 on 2/17/22.
//

import UIKit

class CellPhoneCreditTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operatorUIButton.changesSelectionAsPrimaryAction = true
        operatorUIButton.showsMenuAsPrimaryAction = true
        operatorUIButton.menu = UIMenu(title: "", children: menuOperator())
        
        paymentUIButton.changesSelectionAsPrimaryAction = true
        paymentUIButton.showsMenuAsPrimaryAction = true
        paymentUIButton.menu = UIMenu(title: "", children: menuPayment())
        
    }
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var rechargeValueTextField: UITextField!
    @IBOutlet weak var operatorUIButton: UIButton!
    @IBOutlet weak var paymentUIButton: UIButton!
    
    
    func menuOperator () -> [UIAction] {
        
        let optionOne = UIAction(title: "Operadora", handler: {action in
            return
        })
        let optionTwo = UIAction(title: "FourPhone", handler: {action in
            return
        })
        let optionThree = UIAction(title: "4Call", handler: {action in
            return
        })
        let menu = [optionOne, optionTwo, optionThree]
        
        return menu
    }
    
    func menuPayment () -> [UIAction] {
        
        let optionOne = UIAction(title: "Pagamento", handler: {action in
            return
        })
        let optiontwo = UIAction(title: "Débito", handler: {action in
            return
        })
        let optionThree = UIAction(title: "Crédito", handler: {action in
            return
        })
        let menu = [optionOne, optiontwo, optionThree]
        
        return menu
    }
    
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        
        if operatorUIButton.currentTitle == "Operadora"{
            let alert = UIAlertController(title: "Erro", message: "Selecione uma operadora", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        if paymentUIButton.currentTitle == "Pagamento"{
            let alert = UIAlertController(title: "Erro", message: "Selecione uma forma de pagamento", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
        if phoneNumberTextField.text == "" || rechargeValueTextField.text  == "" {
            let alert = UIAlertController(title: "Erro", message: "Os campos não foram preenchidos corretamente", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Recarga", message: "Recarga efetuada com sucesso", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
