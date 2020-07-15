//
//  BaiTap1ViewController.swift
//  BaiTapDrawing
//
//  Created by NganHa on 7/9/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap1ViewController: UIViewController {

    // MARK: - Properties
    var graphs = GraphicsDraw()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createLineBase()
        createColumnAndValue()
        view.addSubview(graphs)
    }

    // MARK: - Private functions
    private func createLineBase() {
        graphs = GraphicsDraw(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 600))
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
    
    private func createColumnAndValue() {
        var xCol: Int = 60
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
            graphs.createRectangle(position: CGPoint(x: xCol, y: 350 - height), height: Float(height))
            graphs.addLabel(position: CGPoint(x: xCol, y: 350), name: data.key, fontSize: newFontSize)
            xCol += 40
        }
    }
}

extension String {
    func contentWidth(font: UIFont) -> CGFloat {
        let size = (self as NSString).size(withAttributes: [.font: font])
        return size.width
    }
}
