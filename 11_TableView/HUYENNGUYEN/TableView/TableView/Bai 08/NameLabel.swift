//
//  NameLabel.swift
//  TableView
//
//  Created by bu on 8/4/20.
//

import UIKit

class NameLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        text = "name"
        textColor = .red
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
