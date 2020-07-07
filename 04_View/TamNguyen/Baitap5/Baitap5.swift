//
//  Baitap5.swift
//  TAMNGUYEN
//
//  Created by PCI0001 on 7/3/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

class Baitap5: UIViewController {

    @IBOutlet var blackThanh: UIView!
    @IBOutlet var blueThanh: UIView!
    @IBOutlet var buttonPress: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        // Lấy toạ độ chạm
        let touch = touches.first
        let point:CGPoint = touch!.location(in: <#T##UIView?#>)
        // Lấy view Target
//        let v:UIView = self.view.viewWithTag(<#T##tag: Int##Int#>)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
