//
//  ViewController.swift
//  convert
//
//  Created by Brice on 11/02/2019.
//  Copyright © 2019 Brice. All rights reserved.
//

import UIKit

// Créer des constantes présentes dans l'ensemble de l'application

let CASH = "Cash"
let LENGTH = "Length"
let TEMPERATURE = "Temperature"

class ViewController: UIViewController {
    
    // Déclarations variables/constantes propre à la page
    
    let segueID: String = "Convert"
    var views: [UIView] = []

    @IBOutlet weak var cashView: UIView!
    @IBOutlet weak var lengthView: UIView!
    @IBOutlet weak var temperatureView: UIView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        views = [cashView, lengthView, temperatureView]
        
        addShadow()
        addRoundCorner()

        
    }
    
    // Fonctions de stylisation de la vue
    
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
    
    // Permet la transition entre deux pages

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID {
            if let convertController = segue.destination as? ConvertController{
                convertController.type = sender as? String
            }
        }
    }
    
    // Actions from Storyboard  
    
    @IBAction func actionButton(_ sender: UIButton)
    {
        switch sender.tag {
        case 0: performSegue(withIdentifier: segueID, sender: CASH)
        case 1: performSegue(withIdentifier: segueID, sender: LENGTH)
        case 2: performSegue(withIdentifier: segueID, sender: TEMPERATURE)

        default:
            break
        }
        
    }
    
}

