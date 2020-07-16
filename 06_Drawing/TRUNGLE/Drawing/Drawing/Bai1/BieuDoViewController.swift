//
//  BieuDoViewController.swift
//  Drawing
//
//  Created by Abcd on 7/8/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class BieuDoViewController: UIViewController {
      // MARK: - Propeties
      var graphs = GraphicsDraw()
      // MARK: - Life cycle
      override func viewDidLoad() {
          super.viewDidLoad()
          createLineBase()
          createColumnAndValue()
          view.addSubview(graphs)
      }
      // MARK: - Private functions
      func createLineBase() {
          graphs = GraphicsDraw(frame: CGRect(x: 0, y: 200, width: view.bounds.width, height: 600))
          let xLine: Int = 60
          var yLine: Int = 50
          var nameLabel: Int = 105
          for _ in 1...4 {
              graphs.drawLine(start: CGPoint(x: xLine, y: yLine), end: CGPoint(x: Int(view.bounds.width) - 70, y: yLine))
              graphs.addLabel(position: CGPoint(x: xLine - 50, y: yLine - 25), name: String(nameLabel))
              nameLabel -= 5
              yLine += 100
          }
      }
      func createData() -> [(key: String, value: Int)]{
          return [("Tue", 20), ("Web", 92), ("Thu", 59), ("Fri", 68), ("Sat", 50), ("Sun", 70), ("Today", 85)]
      }
      func createColumnAndValue() {
          var xCol: Int = 60
          let dataArray = createData()
          for data in dataArray {
              let height = data.value * 300 / 100
              graphs.createRectangle(position: CGPoint(x: xCol, y: 350 - height), height: Float(height))
              graphs.addLabel(position: CGPoint(x: xCol, y: 350), name: data.key)
              xCol += 40
          }
      }
}
