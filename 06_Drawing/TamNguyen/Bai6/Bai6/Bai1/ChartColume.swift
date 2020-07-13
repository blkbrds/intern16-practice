//
//  ChartColume.swift
//  Bai6
//
//  Created by PCI0001 on 7/11/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class ChartColume: UIView {
    
    static let heightLabel: CGFloat = 40
    let widthLabel: CGFloat = 70
    
     init(frame: CGRect, name: String, backgroundColor: CGColor, nameColor: UIColor) {
        super.init(frame: frame)
        createRectangle(name: name, backgroundColor: backgroundColor, nameColor: nameColor )
    }
    required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
    
    private func createRectangle(name: String, backgroundColor: CGColor, nameColor: UIColor) {
     clipsToBounds = false
        let path1 = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height - ChartColume.heightLabel))
        let nameLabel = UILabel(frame: CGRect(x: bounds.width / 2 - widthLabel / 2, y: path1.bounds.height, width: widthLabel, height: ChartColume.heightLabel))
        nameLabel.text = name
        nameLabel.textColor = nameColor
        nameLabel.textAlignment = .center
        nameLabel.clipsToBounds = false
        nameLabel.font = .systemFont(ofSize: 11)
        addSubview(nameLabel)
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.fillColor = backgroundColor
        shapeLayer1.lineWidth = 1
        shapeLayer1.path = path1.cgPath
        self.layer.addSublayer(shapeLayer1)
    }
}

