//
//  PictureViewController.swift
//  ProjetoStartupFourcamp
//
//  Created by user212293 on 1/24/22.
//

import UIKit

class PictureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var flag = true

    @IBAction func chooseButtonTaped(_ sender: Any) {
        if flag == true {
            let alert = UIAlertController(title: "Foto validada com sucesso", message: "A foto enviada passou pelo processo de validação.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
                profilePicture = 1
                profileHome = UIImage(named: "profile_medium")
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Foto inválida", message: "A foto enviada não pôde ser validada, por favor tente novamente.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tentar Novamente", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
