//
//  Baitap14ViewController.swift
//  baitap07
//
//  Created by NXH on 7/12/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap14ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var photosLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabel()
    }
    
    // MARK: - Private Function
    private func configLabel() {
        photosLabel.underline()
        photosLabel.font = UIFont.boldSystemFont(ofSize: 17)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.text = "The iPhone is a smartphone made by Apple that combines a computer, iPod, digital camera and cellular phone into one device with a touchscreen interface. The iPhone runs the iOS operating system (OS), and as of 2017, there were 2.2 million apps available for it through the Apple App Store, according to Statista"
    }
}

extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}

