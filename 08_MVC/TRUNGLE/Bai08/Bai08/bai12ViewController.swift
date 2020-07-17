//
//  bai12ViewController.swift
//  BaiTap07
//
//  Created by Abcd on 7/15/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class bai12ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var displayLabel: UILabel!
    
    // MARK: - Properties
    private var endEditing: Bool = true
    // MARK: - IBAction
    
    @IBAction func calcButton(_ sender: UIButton) {
        endEditing = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot covert text to Double")
        }
        
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        if let number = sender.currentTitle {
            if endEditing  {
                displayLabel.text = String(number)
                endEditing = false
            }
            else {
                displayLabel.text = displayLabel.text! + number
            }
            
        }
    }
}
