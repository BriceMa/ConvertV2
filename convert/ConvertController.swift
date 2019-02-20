//
//  ConvertController.swift
//  convert
//
//  Created by Brice on 18/02/2019.
//  Copyright © 2019 Brice. All rights reserved.
//

import UIKit

class ConvertController: UIViewController {
    
    // Déclarations de variables
    
    var type: String?
    var views: [UIView] = []
    var isReverse: Bool = false
    var format = "%.2f"
    
    let euros = "euros"
    let dollar = "dollar"
    let km = "kilometers"
    let miles = "miles"
    let celsius = "celsius"
    let fahrenheit = "fahrenheit"

    // Déclarations Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var entryView: UIView!
    @IBOutlet weak var toDoLabel: UILabel!
    @IBOutlet weak var dataTextField: UITextField!
    
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let choix = type {
            views.append(contentsOf: [entryView, resultView])
            addRoundCorner()
            addShadow()
            typeChoice(choix)
        } else{
            dismiss(animated: true, completion: nil)
        }
        
// Permet de rétracter le keyboard une fois que la saisie est terminée
        
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector (hideKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func hideKeyboard(){
         view.endEditing(true)
    }
    
    func typeChoice(_ choix: String) {
        switch choix{
            case CASH: setup(euros, dollar)
            case LENGTH: setup(km, miles)
            case TEMPERATURE: setup(celsius, fahrenheit)
        default: break
        }
    }
    
    // Fonctions de stylisation de la vue
    
    func setup (_ primary: String, _ secondary: String) {
        if !isReverse {
            titleLabel.text = "Convertir " + primary + " en " + secondary
            toDoLabel.text = "Entrez votre nombre de " + primary
        } else {
            titleLabel.text = "Convertir " + secondary + " en " + primary
            toDoLabel.text = "Entrez votre nombre de " + secondary

        }
    }
    
    func addShadow (){
        for v in views {
            v.layer.shadowColor = UIColor.gray.cgColor
            v.layer.shadowOpacity = 0.2
            v.layer.shadowOffset = CGSize(width: -1.0, height: 1.0)
            v.layer.shadowRadius = 4.0
        }
    }
    
    func addRoundCorner (){
        for v in views {
            v.layer.cornerRadius = 10
        }
    }
    
    // Logique de calcul
    
    func calculate(){
        if let monType = type,
            let text = dataTextField.text,
            let double = Double(text){
            switch monType {
            case CASH:
                resultLabel.text = isReverse ? euros(double) : dollar(double)
            case LENGTH:
                resultLabel.text = isReverse ? km(double) : miles(double)
            case TEMPERATURE :
                resultLabel.text = isReverse ? celsius(double) : fahrenheit(double)
            default: break
            }
            
        }
    }
    
    func dollar (_ euros: Double) -> String {
        return String(format: format, (euros / 0.81)) + "$"
    }
    
    func euros(_ dollar: Double) -> String {
        return String(format: format, (dollar * 0.81)) + "€"
    }
    
    func km (_ miles: Double) -> String {
        return String(format: format, (miles / 0.621)) + "km"
    }
    
    func miles(_ km: Double) -> String {
        return String(format: format, (km * 0.621)) + "miles"

    }
    
    func celsius (_ fahrenheit: Double) -> String {
        return String(format: format, ((fahrenheit - 32) / 1.8)) + "°C"
    }
    
    func fahrenheit(_ celsius: Double) -> String {
        return String(format: format, ((celsius*1.8)-32)) + "F"
    }




    // Déclarations des actions
    
    @IBAction func changeButton(_ sender: Any) {
        guard type != nil else { return }
        isReverse = !isReverse
        typeChoice(type!)
        calculate()
    }
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func textChanged(_ sender: UITextField) {
        calculate()
    }
    
}
