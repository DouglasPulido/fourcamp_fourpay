//
//  LoginViewController.swift
//  ProjetoStartupFourcamp
//
//  Created by user212293 on 1/5/22.
//

import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var switchTermsButton: UISwitch!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var eyeSlashButton: UIButton!
    
    
    @IBOutlet weak var switchSaveLogin: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if switchSaveLogin.isOn{
            passwordTextField.text = ""
        }
        else {
            loginTextField.text = ""
            passwordTextField.text = ""
        }
    }
    
    @IBAction func passwordTextFieldTapped(_ sender: Any) {
        let isSecureTextEntry = passwordTextField.isSecureTextEntry
            passwordTextField.isSecureTextEntry = isSecureTextEntry ? false : true
        if isSecureTextEntry {
            eyeSlashButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            eyeSlashButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let typedNameLogin = loginTextField.text ?? ""
        let typedPasword = passwordTextField.text ?? ""
        
        if typedNameLogin.isEmpty || typedPasword.isEmpty{
            
            let alert = UIAlertController (title: "Erro de Login", message: "Usuário ou Senha Inválidos!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        }
        
        else if (typedNameLogin == userLogin && typedPasword == userPassword) || (typedNameLogin == loginUserName && typedPasword == loginPassword) {
            
            greetinsName = typedNameLogin
        }
        
        else {
            let alert = UIAlertController (title: "Erro de Login", message: "Usuário ou Senha Inválidos!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

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
