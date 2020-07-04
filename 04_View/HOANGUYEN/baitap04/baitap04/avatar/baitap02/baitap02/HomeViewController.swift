//
//  HomeViewController.swift
//  baitap02
//
//  Created by NXH on 6/29/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit



class HomeViewController: UIViewController {
    // MARK: - properties
    let arrHinh: Array<String> = ["avatar1", "avatar2", "avatar3", "avatar4", "avatar5", "avatar6", "avatar7", "avatar8", "avatar9"]
    let arrName: Array<String> = ["Name1", "Name2", "Name3", "Name4", "Name5", "Name6", "Name7", "Name8", "Name9"]

    let lblName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Name"
        lbl.textAlignment = .center
        lbl.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return lbl
    }()

    let imgAvater: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.frame = CGRect(x: 0, y: 0, width: 50, height: 100)
        img.image = UIImage(named: "avatar0")
        return img
    }()
    
    func viewForPerson(img: UIImageView, lbl: UILabel) -> UIView{
        let uiView: UIView = UIView()
        uiView.addSubview(img)
        uiView.addSubview(lbl)
        img.frame = CGRect(x: 0, y: 0, width: <#T##Double#>, height: 130)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
