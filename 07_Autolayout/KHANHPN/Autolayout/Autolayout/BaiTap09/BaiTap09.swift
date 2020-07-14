//
//  BaiTap09.swift
//  Autolayout
//
//  Created by PCI0007 on 7/9/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

class BaiTap09: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var numberTextLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var contentTextLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var previousOutlet: UIButton!
    @IBOutlet weak var nextOutlet: UIButton!
    
    var imageNum = 0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageNum = 1
        numberTextLabel.text = "\(imageNum)/5"
        previousOutlet.isEnabled = false
        configContentText()
    }
    
    // MARK: - Functions
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configContentText() {
        contentTextLabel.layer.borderWidth = 1.0
        contentTextLabel.layer.borderColor = UIColor.systemTeal.cgColor
    }
    
    // MARK: - Image Gallery
    func imageGallery() {
        if imageNum == 1 {
            previousOutlet.isEnabled = false
            thumbImageView.image = UIImage(named: "img-1")
            contentTextLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        }
        if imageNum == 2 {
            previousOutlet.isEnabled = true
            thumbImageView.image = UIImage(named: "img-2")
            contentTextLabel.text = "Kimochi"
        }
        if imageNum == 3 {
            thumbImageView.image = UIImage(named: "img-3")
            contentTextLabel.text = "Lorem ipsum"
        }
        if imageNum == 4 {
            nextOutlet.isEnabled = true
            thumbImageView.image = UIImage(named: "img-4")
            contentTextLabel.text = "Hỡi ơi! Súng giặc đất rền; lòng dân trời tỏ.Mười năm công vỡ ruộng, chưa ắt còn danh nổi như phao. Một trận nghĩa đánh Tây, thân tuy mất tiếng vang như mõ. Nhớ linh xưa: Cui cút làm ăn; Riêng lo nghèo khó."
        }
        if imageNum == 5 {
            nextOutlet.isEnabled = false
            thumbImageView.image = UIImage(named: "img-5")
            contentTextLabel.text = "iOS"
        }
    }
    
    // MARK: - Actions
    @IBAction func previousButton(_ sender: Any) {
        imageNum -= 1
        numberTextLabel.text = "\(imageNum)/5"
        self.imageGallery()
    }
    @IBAction func nextButton(_ sender: Any) {
        imageNum += 1
        numberTextLabel.text = "\(imageNum)/5"
        self.imageGallery()
    }
}
