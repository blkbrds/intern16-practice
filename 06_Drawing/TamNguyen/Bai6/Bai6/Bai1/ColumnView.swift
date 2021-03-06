//
//  ChartColume.swift
//  Bai6
//
//  Created by PCI0001 on 7/11/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class ColumnView: UIView {
    // MARK: - Properties
    static let labelHeight: CGFloat = 40
    let labelWidth: CGFloat = 70
    
    init(frame: CGRect, name: String, backgroundColor: CGColor, nameColor: UIColor) {
        super.init(frame: frame)
        createRectangle(name: name, backgroundColor: backgroundColor, nameColor: nameColor )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func createRectangle(name: String, backgroundColor: CGColor, nameColor: UIColor) {
        clipsToBounds = false
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height - ColumnView.labelHeight))
        let nameLabel = UILabel(frame: CGRect(x: bounds.width / 2 - labelWidth / 2, y: path.bounds.height, width: labelWidth, height: ColumnView.labelHeight))
        nameLabel.text = name
        nameLabel.textColor = nameColor
        nameLabel.textAlignment = .center
        nameLabel.clipsToBounds = false
        nameLabel.font = .systemFont(ofSize: 11)
        addSubview(nameLabel)
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = backgroundColor
        shapeLayer.lineWidth = 1
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
    }
}
