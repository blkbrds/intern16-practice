//
//  BaiTap01VC.swift
//  BaiTap04
//
//  Created by hieungq on 6/27/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class BaiTap01VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .white
        setupImageView()
    }
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "defaultProfileImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Menlo", size: 16)
        label.text = "Hieu Nguyen"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    func setupImageView() {
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: (view.frame.width - 64) / 3).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: (view.frame.width - 64) / 3 ).isActive = true        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: (view.frame.width - 64) / 3 ).isActive = true
    }
    

    
}
