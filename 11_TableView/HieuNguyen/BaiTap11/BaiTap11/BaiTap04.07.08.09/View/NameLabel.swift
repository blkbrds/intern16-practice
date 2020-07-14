//
//  NameLabel.swift
//  BaiTap11
//
//  Created by PCI0020 on 7/14/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class NameLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLabel() {
        text = "name"
        font = UIFont(name: "Menlo", size: 12)
        textColor = .red
    }

}
