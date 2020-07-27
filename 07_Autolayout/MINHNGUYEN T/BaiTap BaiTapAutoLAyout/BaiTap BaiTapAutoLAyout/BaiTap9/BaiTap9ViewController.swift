//
//  BaiTap9ViewController.swift
//  BaiTap BaiTapAutoLAyout
//
//  Created by MacBook Pro on 7/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap9ViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet private weak var numberOfImageLabel: UILabel!
    @IBOutlet private weak var imageImageView: UIImageView!
    @IBOutlet private weak var descriptionImageLabel: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var commentButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!

    // MARK: - Properties
    private let data: Data = Data()
    private var location: Int = 0

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configButton()
        cofigDescription()
    }

    // MARK: - Private functions
    private func cofigDescription() {
        if data.nameImage.count == 0 {
            numberOfImageLabel.text = ""
            return
        }
        numberOfImageLabel.text = "1 / \(data.nameImage.count)"
        imageImageView.image = UIImage(named: data.nameImage[0])
        descriptionImageLabel.text = data.descriptionImage[0]
    }

    private func configButton() {
        likeButton.layer.cornerRadius = 5
        commentButton.layer.cornerRadius = 5
        shareButton.layer.cornerRadius = 5
    }

    // MARK: - @IBActions
    @IBAction private func nextButtonTouchInside(_ sender: UIButton) {
        location += 1
        if location == data.nameImage.count {
            location = 0
        }
        numberOfImageLabel.text = "\(location + 1) / \(data.nameImage.count)"
        imageImageView.image = UIImage(named: data.nameImage[location])
        descriptionImageLabel.text = data.descriptionImage[location]
    }
    
    @IBAction private func backButtonTouchUpInside(_ sender: UIButton) {
        location -= 1
        if location < 0 {
            location = data.nameImage.count - 1
        }
        numberOfImageLabel.text = "\(location + 1) / \(data.nameImage.count)"
        imageImageView.image = UIImage(named: data.nameImage[location])
        descriptionImageLabel.text = data.descriptionImage[location]
    }
}
