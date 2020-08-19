//
//  BaiTap_01.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/23/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Configure
private struct Configure {
    static let titleName = "Gradient Navigation"
}

final class BaiTap01: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "img_color"), for: .default)
    }
}
