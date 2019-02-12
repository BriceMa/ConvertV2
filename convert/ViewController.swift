//
//  ViewController.swift
//  convert
//
//  Created by Brice on 11/02/2019.
//  Copyright © 2019 Brice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cashView: UIView!
    @IBOutlet weak var lengthView: UIView!
    @IBOutlet weak var temperatureView: UIView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        cashView.layer.shadowColor = UIColor.gray.cgColor
        cashView.layer.shadowOpacity = 0.2
        cashView.layer.shadowOffset = CGSize(width: -1.0, height: 1.0)
        cashView.layer.shadowRadius = 4.0
        
        lengthView.layer.shadowColor = UIColor.gray.cgColor
        lengthView.layer.shadowOpacity = 0.2
        lengthView.layer.shadowOffset = CGSize(width: -1.0, height: 1.0)
        lengthView.layer.shadowRadius = 4.0
        
        temperatureView.layer.shadowColor = UIColor.gray.cgColor
        temperatureView.layer.shadowOpacity = 0.2
        temperatureView.layer.shadowOffset = CGSize(width: -1.0, height: 1.0)
        temperatureView.layer.shadowRadius = 4.0
        
    }

    @IBAction func actionButton(_ sender: UIButton)
    {
        
    }
    
}

