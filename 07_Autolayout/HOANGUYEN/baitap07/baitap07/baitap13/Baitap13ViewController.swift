//
//  Baitap13ViewController.swift
//  baitap07
//
//  Created by NXH on 7/12/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap13ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleCycleButton: UIButton!
    @IBOutlet weak var contentCycleButton: UIButton!
    @IBOutlet weak var unlockerCycleButton: UIButton!
    @IBOutlet weak var friendCycleButton: UIButton!
    @IBOutlet weak var timeCycleButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCycleButton()
        
    }
    
// MARK: - Private function
    private func configCycleButton() {
        titleCycleButton.layer.cornerRadius = 25
        timeCycleButton.layer.cornerRadius = 25
        friendCycleButton.layer.cornerRadius = 25
        contentCycleButton.layer.cornerRadius = 25
        unlockerCycleButton.layer.cornerRadius = 25
    }
}
