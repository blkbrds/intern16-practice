//
//  BaiTap02VC.swift
//  BaiTap09
//
//  Created by PCI0020 on 7/10/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class BaiTap02VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News Feed"
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1820863485, green: 0.3001145422, blue: 0.5367071629, alpha: 1)
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let image:UIImage = UIImage(systemName: "person.fill")!
        let userButton = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = userButton
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.leftBarButtonItem = searchButton
        navigationItem.leftBarButtonItem?.tintColor = .white
        
    }
    
    

}
