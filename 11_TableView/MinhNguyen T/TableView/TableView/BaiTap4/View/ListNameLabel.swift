//
//  ListNameLabel.swift
//  TableView
//
//  Created by MacBook Pro on 7/28/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class ListNameLabel: UILabel {
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        cofigLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions
    func cofigLabel() {
        text = "Name"
        font = UIFont(name: "Helvetica Neue", size: 12)
        textColor = .red
    }
}
