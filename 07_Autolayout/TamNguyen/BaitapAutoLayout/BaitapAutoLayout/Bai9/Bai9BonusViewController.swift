//
//  Bai9BonusViewController.swift
//  BaitapAutoLayout
//
//  Created by PCI0001 on 7/14/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

class Bai9BonusViewController: UIViewController {
    //MARK: - Properties
    var imageNumber = 0
    //MARK: - IBOulet
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet private weak var playerImageView: UIImageView!
    @IBOutlet private weak var contentTextView: UITextView!
    @IBOutlet private weak var numberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - IBActions
    @IBAction func rightButton(_ sender: UIButton) {
        imageNumber += 1
        numberLabel.text = "\(imageNumber)/3"
        self.imagePlayerGallary()
    }
    
    @IBAction func leftButton(_ sender: UIButton) {
        imageNumber -= 1
        numberLabel.text = "\(imageNumber)/3"
        self.imagePlayerGallary()
    }
    
    //MARRK: - Private methods
    private func setupUI() {
        imageNumber = 1
        numberLabel.text = "\(imageNumber)/3"
        numberLabel.textAlignment = .center
    }
    
    private func imagePlayerGallary() {
        if imageNumber == 1 {
            leftButton.isEnabled = false
            playerImageView.image = UIImage(named: "ronaldo")
            contentTextView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        }
        if imageNumber == 2 {
            rightButton.isEnabled = true
            playerImageView.image = UIImage(named: "960")
            contentTextView.text = "hello chao em anh den day tu chieu tam biet em"
        }
        if imageNumber == 3 {
            rightButton.isEnabled = false
            leftButton.isEnabled = true
            playerImageView.image = UIImage(named: "ronaldo")
            contentTextView.text = "tam biet em tam biet tam biet helo"
        }
    }
}
