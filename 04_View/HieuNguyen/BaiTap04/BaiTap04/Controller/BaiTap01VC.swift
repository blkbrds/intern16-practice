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
        setupBai1()
    }
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "defaultProfileImage")
//        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return image
    }()
    
    let nameLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Menlo", size: 16)
        label.text = "Hieu Nguyen"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    func setupBai1() {
        view.addSubview(imageView)
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nextScreen)))
        imageView.isUserInteractionEnabled = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: (view.frame.width - 64) / 3).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: (view.frame.width - 64) / 3 ).isActive = true
        
        view.addSubview(nameLbl)
        nameLbl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
        nameLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        nameLbl.widthAnchor.constraint(equalToConstant: (view.frame.width - 64) / 3 ).isActive = true
    }
    
    @objc func nextScreen() {
        let baiTap02 = BaiTap02VC()
        self.present(baiTap02, animated: true, completion: nil)
    }
    
}
