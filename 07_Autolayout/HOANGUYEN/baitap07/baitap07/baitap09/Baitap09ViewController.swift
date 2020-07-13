//
//  Baitap09ViewController.swift
//  baitap07
//
//  Created by NXH on 7/8/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap09ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var image: UIImageView!
    @IBOutlet weak private var progressImageLabel: UILabel!
    @IBOutlet weak private var likeButton: UIButton!
    @IBOutlet weak private var commentButton: UIButton!
    @IBOutlet weak private var shareButton: UIButton!
    // MARK: - Properties
    private let imageList: HinhAnh = HinhAnh()
    private var position: Int = 0
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Bundle.main.loadNibNamed("Baitap09ViewController", owner: self, options: nil)
        configDescriptionLable()
        configButton()
    }
    // MARK: - Private function
    private func configDescriptionLable() {
        if imageList.descriptionImage.count == 0 {
            descriptionLabel.text = ""
            return
        }
        progressImageLabel.text = "1/\(imageList.nameImage.count)"
        image.image = UIImage(named: imageList.nameImage[0])
        descriptionLabel.text = imageList.descriptionImage[0]
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.layer.borderWidth = 1
        descriptionLabel.layer.borderColor = UIColor.systemBlue.cgColor
        descriptionLabel.layer.cornerRadius = 5
    }
    
    private func configButton() {
        likeButton.layer.cornerRadius = 10
        commentButton.layer.cornerRadius = 10
        shareButton.layer.cornerRadius = 10
    }
    // MARK: - IBAction
    @IBAction func backButtonTouchUpInSide(_ sender: Any) {
        if position > 0 {
            position -= 1
            progressImageLabel.text = "\(position + 1)/\(imageList.nameImage.count)"
            image.image = UIImage(named: imageList.nameImage[position])
            descriptionLabel.text = imageList.descriptionImage[position]
        }
    }
    
    @IBAction func nextButtonTouchUpInSide(_ sender: Any) {
        if position < imageList.nameImage.count - 1 {
            position += 1
            progressImageLabel.text = "\(position + 1)/\(imageList.nameImage.count)"
            image.image = UIImage(named: imageList.nameImage[position])
            descriptionLabel.text = imageList.descriptionImage[position]
        }
    }
}
