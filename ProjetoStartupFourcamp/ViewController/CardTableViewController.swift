//
//  CardTableViewController.swift
//  ProjetoStartupFourcamp
//
//  Created by user212293 on 1/21/22.
//

import UIKit

class CardTableViewController: UITableViewController {

    var array = [false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //Cartoes
    @IBOutlet weak var basicCardCell: UITableViewCell!
    @IBOutlet weak var internacionalCardCell: UITableViewCell!
    @IBOutlet weak var basicCardImageView: UIImageView!
    @IBOutlet weak var internacionalcardImageView: UIImageView!
    
    //Ver detalhes
    @IBOutlet weak var detailsCardButton: UIButton!
    @IBOutlet weak var detailsInternacionalCardButton: UIButton!
    
    @IBAction func detailsCardButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "modalyMediumSegue", sender: sender)
    }
    
    @IBAction func detailsInternacionalCardButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "modalyInternacionalMediumSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "modalyMediumSegue" || segue.identifier == "modalyInternacionalMediumSegue" {
            segue.destination
                .sheetPresentationController?.detents = [UISheetPresentationController.Detent.medium()]
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var index = 0
        for _ in array{
            tableView.cellForRow(at: IndexPath(row: index, section: 0))?.accessoryType = .none
            index = index + 1
    }

        flag = indexPath.row
        let touchedCell = tableView.cellForRow(at: indexPath as IndexPath)
        touchedCell?.accessoryType = .checkmark
        array[indexPath.row] = true
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    var flag = -1
         
    @IBAction func finishButtonTaped(_ sender: Any) {
         if flag > -1 {
            let alert = UIAlertController(title: "Cadastro concluido", message: "Faça o login", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in self.performSegue(withIdentifier: "segueLogin", sender: (Any).self)
            }))
            self.present(alert, animated: true, completion: nil)
            cardImageView = flag
        }else{
            let alert = UIAlertController(title: "Erro", message: "Favor selecionar uma opção", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
