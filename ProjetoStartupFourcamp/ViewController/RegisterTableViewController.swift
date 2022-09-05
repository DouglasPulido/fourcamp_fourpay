//
//  RegisterTableViewController.swift
//  ProjetoStartupFourcamp
//
//  Created by user212293 on 1/24/22.
//

import UIKit

class RegisterTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let allTextFieldsRegister: [UITextField] = [nameTextField, cpfTextField, rgTextField, birthdayTextField, incomeTextField, maritalStatusTextField, addressTextField, cepTextField, addressNumberTextField, complementTextField, neighborhoodTextField, cityTextField, stateTextField, emailTextField, celPhoneTextField, newPasswordTextField, confirmPasswordTextField]
        allTextFields = allTextFieldsRegister
        for tf in allTextFieldsRegister{
            tf.delegate = self
        }
}
    
    override func viewWillAppear(_ animated: Bool) {
        if profilePicture == 1 {
            self.profileImageView.image = UIImage(named: "profile_medium")
        }
    }
    
    //Dados Pessoais
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var rgTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var maritalStatusTextField: UITextField!
    
    //Localizacao
    @IBOutlet weak var cepTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var addressNumberTextField: UITextField!
    @IBOutlet weak var complementTextField: UITextField!
    @IBOutlet weak var neighborhoodTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    //Contato
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var celPhoneTextField: UITextField!
    
    //Criacao de Conta
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    //Termos e imagem do profile
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var termsSwitchButton: UISwitch!
    @IBOutlet weak var termsButton: UIButton!
    
    var allTextFields: [UITextField] = []
    @IBOutlet weak var registerButton: UIButton!
    var currentTextFieldPositon: Int = 0
    
    var flagPicture = false
    var flagTerms = false
    
    @IBAction func termsSwitchButtonTapped(_ sender: Any) {
         if termsButton.isTouchInside == false{
             termsSwitchButton.isOn = false
         }else{
             termsSwitchButton.isOn = true
         }
    }
    
    @IBAction func termsButton(_ sender: Any) {
        termsSwitchButton.isOn = true
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        self.flagPicture = true
        let alert = UIAlertController(title: "Confirme sua identidade", message: "Por favor, envie uma foto do seu rosto!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tirar Foto", style: .default, handler: {(action) in
            self.performSegue(withIdentifier: "pictureSegue", sender: (Any).self)
        }))
        alert.addAction(UIAlertAction(title: "Escolher Foto", style: .default, handler: {(action) in self.performSegue(withIdentifier: "pictureSegue", sender: (Any).self)
        }))
        alert.addAction(UIAlertAction(title: "Explorar...", style: .default, handler: { (action) in
            self.present(imagePicker, animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func termsButtonTapped(_ sender: Any) {
        self.flagTerms = true
        }
    
    func textValidated() -> Bool{
        let text = allTextFields.allSatisfy{
            $0.hasText
        }
        if text == true{
            return true
        }
        else{
            return false
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        if textValidated() == true{
        }
        else{
            let alert = UIAlertController(title: "Erro de Cadastro", message: "Nem todos os campos foram preenchidos corretamente", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
        if newPasswordTextField.text == confirmPasswordTextField.text{
        }
        else{
            let alert = UIAlertController(title: "Erro de Cadastro", message: "As senhas digitadas não correspondem", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
       if profilePicture == 1 && flagTerms == true {
            let alert = UIAlertController(title: "Cadastro concluido", message: "Por favor selecione o cartão", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in self.performSegue(withIdentifier: "cardSegue", sender: (Any).self)
            }))
            self.present(alert, animated: true, completion: nil)
        }else if profilePicture == 0{
            let alert = UIAlertController(title: "Erro", message: "Favor selecionar uma foto válida", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
             self.present(alert, animated: true, completion: nil)
        }else {
            let alert = UIAlertController(title: "Erro", message: "Favor ler os termos para continuar", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
        loginUserName = nameTextField.text ?? ""
        loginPassword = newPasswordTextField.text ?? ""
    }

}
extension RegisterTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            profileImageView.image = image
            profilePicture = 1
            profileHome = image
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension String {
    func formatMask(mask: String) -> String {
        let cleanField = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

        var result = ""
        var startIndex = cleanField.startIndex
        let endIndex = cleanField.endIndex

        for ch in mask where startIndex < endIndex {
            if ch == "#" {
                result.append(cleanField[startIndex])
                startIndex = cleanField.index(after: startIndex)
            } else {
                result.append(ch)
            }
    }
        return result
    }
}

extension RegisterTableViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextFieldPositon = allTextFields.firstIndex(of: textField) ?? 0
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        currentTextFieldPositon = currentTextFieldPositon + 1
        if currentTextFieldPositon > allTextFields.count - 1 {
            currentTextFieldPositon = 0
        }
        let newTextField = allTextFields[currentTextFieldPositon]
        newTextField.becomeFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if cpfTextField.isEditing == true{
            cpfTextField.text = cpfTextField.text?.formatMask(mask: "###.###.###-##" )
        }
        if rgTextField.isEditing == true{
            rgTextField.text = rgTextField.text?.formatMask(mask: "##.###.###-#")
        }
        if birthdayTextField.isEditing == true {
            birthdayTextField.text = birthdayTextField.text?.formatMask(mask: "##/##/####")
        }
        if cepTextField.isEditing == true {
            cepTextField.text = cepTextField.text?.formatMask(mask: "#####-###")
        }
        if celPhoneTextField.isEditing == true {
            celPhoneTextField.text = celPhoneTextField.text?.formatMask(mask: "(##)#####-####")
        }
    }
}
