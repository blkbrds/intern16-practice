//
//  BaiTap01VC.swift
//  BaiTap06
//
//  Created by PCI0020 on 7/2/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

final class BaiTap01: UIViewController {
    
    // MARK: - Properties
    private var graphs = GraphicsDraw()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createLineBase()
        createColumn()
        view.addSubview(graphs)
    }
    
    // MARK: - Private functions
    private func createLineBase() {
        graphs = GraphicsDraw(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 800))
        let xLine: Int = 60
        var yLine: Int = 50
        var nameLabel: Int = 105
        for _ in 1...4 {
            graphs.drawLine(start: CGPoint(x: xLine, y: yLine), end: CGPoint(x: Int(UIScreen.main.bounds.width) - 70, y: yLine))
            graphs.addLabel(position: CGPoint(x: xLine - 50, y: yLine - 25), name: String(nameLabel))
            nameLabel -= 5
            yLine += 100
        }
    }
    
    private func createData() -> [(key: String, value: Int)] {
        return [("Tue", 20), ("Wed", 92), ("Thu", 59), ("Fri", 68), ("Sat", 50), ("Sun", 70), ("Today", 85)]
    }
    
    private func createColumn() {
        var verticalColumn: Int = 60
        let dataArray = createData()
        var maxWidth: CGFloat = 0
        for data in dataArray {
            if maxWidth < data.key.contentWidth(font: UIFont.systemFont(ofSize: 17)) {
                maxWidth = data.key.contentWidth(font: UIFont.systemFont(ofSize: 17))
            }
        }
        let labelFrameRealWidth: CGFloat = 25
        let maxScale = labelFrameRealWidth / maxWidth
        let newFontSize = min(17, (17 * maxScale).rounded(.down))
        for data in dataArray {
            let height = data.value * 300 / 100
            graphs.createRectangle(position: CGPoint(x: verticalColumn, y: 350 - height), height: Float(height))
            graphs.addLabel(position: CGPoint(x: verticalColumn, y: 350), name: data.key, fontSize: newFontSize)
            verticalColumn += 40
        }
    }
}

// MARK: -Extensions
extension String {
    func contentWidth(font: UIFont) -> CGFloat {
        let size = (self as NSString).size(withAttributes: [.font: font])
        return size.width
    }
}
