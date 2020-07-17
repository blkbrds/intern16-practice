//
//  BaiTap14.swift
//  BaiTapAutoLayout
//
//  Created by PCI0004 on 7/16/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

class BaiTap14: UIViewController {
    @IBOutlet private weak var avatarView: UIImageView!
    @IBOutlet private weak var centerView: UIImageView!
    @IBOutlet private weak var photo1View: UIImageView!
    @IBOutlet private weak var photo2View: UIImageView!
    @IBOutlet private weak var photo3View: UIImageView!
    @IBOutlet private weak var photo4View: UIImageView!
    @IBOutlet private weak var photo5View: UIImageView!
    @IBOutlet private weak var photo6View: UIImageView!
    @IBOutlet private weak var photo7View: UIImageView!
    @IBOutlet private weak var photo8View: UIImageView!
    @IBOutlet private weak var photo9View: UIImageView!



    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    private func configUI() {
        avatarView.image = UIImage(named: "img_avatar_01")
        centerView.image = UIImage(named: "img_center_01")
        photo1View.image = UIImage(named: "img_nature_01")
        photo2View.image = UIImage(named: "img_nature_02")
        photo3View.image = UIImage(named: "img_nature_03")
        photo4View.image = UIImage(named: "img_nature_04")
        photo5View.image = UIImage(named: "img_nature_05")
        photo6View.image = UIImage(named: "img_nature_06")
        photo7View.image = UIImage(named: "img_nature_07")
        photo8View.image = UIImage(named: "img_nature_08")
        photo9View.image = UIImage(named: "img_nature_09")
    }
}
