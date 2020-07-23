//
//  BaiTap4cViewController.swift
//  Navigation
//
//  Created by MacBook Pro on 7/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap4cViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNaviBar()
    }
    
    // MARK: - Private functions
    private func configNaviBar() {
        view.backgroundColor = .white
        let addButton = UIBarButtonItem(image: UIImage(named: "images_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
           navigationController?.navigationBar.tintColor = .systemRed
           navigationItem.rightBarButtonItem = addButton
       }
}
