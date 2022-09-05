//
//  HomePageViewController.swift
//  ProjetoStartupFourcamp
//
//  Created by user212293 on 1/31/22.
//

import UIKit

class HomePageTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if cardImageView == 0 {
            selectedCardImageView.image = UIImage (named: "cartão1")
        }
        else{
            selectedCardImageView.image = UIImage(named: "cartão2")
        }
        
        homeProfileImageView.image = profileHome

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        userNameLabel.text = "Olá, \(greetinsName)"
        balanceLabel.text = "R$ \(String(format:"%.2f",currentBalance))"
        billLabel.text = "R$ \(String(format:"%.2f",currentBill))"
        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var balanceEyeButton: UIButton!
    @IBOutlet weak var billEyeButton: UIButton!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var homeProfileImageView: UIImageView!
    
    
    @IBOutlet weak var selectedCardImageView: UIImageView!
    
    @IBAction func balanceEyeButtonTapped(_ sender: Any) {
        
        if balanceEyeButton.currentImage == UIImage(systemName: "eye.slash.fill"){
                balanceLabel.text = "R$ \(String(format:"%.2f",currentBalance))"
                balanceEyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            } else {
                balanceLabel.text = "R$ ******"
                balanceEyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            }
    }
    
    
    @IBAction func billEyeButtonTapped(_ sender: Any) {
        
        if billEyeButton.currentImage == UIImage(systemName: "eye.slash.fill"){
                billLabel.text = "R$ \(String(format:"%.2f",currentBill))"
                billEyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            } else {
                billLabel.text = "R$ ******"
                billEyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            }
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
