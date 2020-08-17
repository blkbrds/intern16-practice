//
//  BaiTap09A.swift
//  BaiTapAutoLayout
//
//  Created by PCI0004 on 7/15/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap09A: UIViewController {

//    struct Image {
//        var imageView: UIImage
//        var detail: String = ""
//    }
//    var images: [Image] = [
//        Image(imageView: UIImage(named: "img_nature_01")!, detail: "text1"),
//        Image(imageView: UIImageView(image: UIImage(named: "img_nature_02")), detail: "text2"),
//        Image(imageView: UIImageView(image: UIImage(named: "img_nature_03")), detail: "text3"),
//        Image(imageView: UIImageView(image: UIImage(named: "img_nature_04")), detail: "text4"),
//        Image(imageView: UIImageView(image: UIImage(named: "img_nature_05")), detail: "text5"),
//        Image(imageView: UIImageView(image: UIImage(named: "img_nature_06")), detail: "text6")
//    ]

    // MARK: - IBOutlets
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var leftButton: UIButton!
    @IBOutlet private weak var rightButton: UIButton!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var natureImageView: UIImageView!

    var numberImage: Int = 1

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        procesImage()

    }
    
    private func checkImage() {
        if numberImage <= 1 {
            leftButton.isEnabled = false
        } else if numberImage >= 6 {
            rightButton.isEnabled = false
        } else {
            leftButton.isEnabled = true
            rightButton.isEnabled = true
        }
    }
    
    private func procesImage() {
        switch numberImage {
        case 1:
            checkImage()
            numberLabel.text = "\(numberImage)/6"
            natureImageView.image = UIImage(named: "img_nature_01")
            detailLabel.text = "Nature, xuất bản lần đầu tiên ngày 4 tháng 11 năm 1869, được xếp hạng làm một trong những tập san khoa học đa ngành có trích dẫn nhiều nhất bởi Tổ chức Báo cáo dẫn chứng trên các tạp chí Journal Citation Reports tại đánh giá Science Edition năm 2010"
        case 2:
            checkImage()
            numberLabel.text = "\(numberImage)/6"
            natureImageView.image = UIImage(named: "img_nature_02")
            detailLabel.text = "Nature, xuất bản lần đầu tiên ngày 4 tháng 11 năm 1869"
        case 3:
            checkImage()
            numberLabel.text = "\(numberImage)/6"
            natureImageView.image = UIImage(named: "img_nature_03")
            detailLabel.text = ""
        case 4:
            checkImage()
            numberLabel.text = "\(numberImage)/6"
            natureImageView.image = UIImage(named: "img_nature_04")
            detailLabel.text = "Nature, xuất bản lần đầu tiên ngày 4 tháng 11 năm 1869, được xếp hạng làm một trong những tập san khoa học đa ngành "
        case 5:
            checkImage()
            numberLabel.text = "\(numberImage)/6"
            natureImageView.image = UIImage(named: "img_nature_05")
            detailLabel.text = ""
        case 6:
            checkImage()
            numberLabel.text = "\(numberImage)/6"
            natureImageView.image = UIImage(named: "img_nature_06")
            detailLabel.text = "Nature, xuất bản lần đầu tiên ngày 4 tháng 11 năm 1869, được xếp hạng làm một trong những tập san khoa học đa ngành có trích dẫn nhiều nhất bởi Tổ chức Báo cáo dẫn chứng trên các tạp chí Journal Citation Reports tại đánh giá Science Edition năm 2010 Nature, xuất bản lần đầu tiên ngày 4 tháng 11 năm 1869, được xếp hạng làm một trong những tập san khoa học đa ngành có trích dẫn nhiều nhất bởi Tổ chức Báo cáo dẫn chứng trên các tạp chí Journal Citation Reports tại đánh giá Science Edition năm 2010"
        default:
            print("Loi")
        }
    }

    @IBAction func leftClick(_ sender: Any) {
        numberImage -= 1
        procesImage()
    }
    @IBAction func rightClick(_ sender: Any) {
        numberImage += 1
        procesImage()
    }


}
