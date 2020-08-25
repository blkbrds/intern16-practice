//
//  Baitap9_1ViewController.swift
//  Baitap7Autolayout
//
//  Created by MBA0245P on 8/25/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap9_1ViewController: UIViewController {

    var imageInfo = [ImageInfo]()
    var order: Int = 0

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet weak var pagingLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        likeButton.layer.cornerRadius = 10
        commentButton.layer.cornerRadius = 10
        shareButton.layer.cornerRadius = 10

        let imageData: CreateImageData = CreateImageData()
        imageData.createData()
        imageInfo = imageData.imageInfo
        configView()
    }

    func configView() {
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseIn, animations: {
            self.photoScrollView.setContentOffset(CGPoint(x: CGFloat(self.order) * self.photoScrollView.bounds.width, y: 0), animated: true)
        }, completion: nil)
        pagingLabel.text = "\(order + 1)/5"
        contentLabel.text = imageInfo[order].info

    }

    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        if order == 4 {
            order = 0
        } else {
            order += 1
        }
        configView()
    }

    @IBAction func previousButtonTouchUpInside(_ sender: UIButton) {
        if order != 0 {
            order -= 1
            configView()
        }
    }
}
