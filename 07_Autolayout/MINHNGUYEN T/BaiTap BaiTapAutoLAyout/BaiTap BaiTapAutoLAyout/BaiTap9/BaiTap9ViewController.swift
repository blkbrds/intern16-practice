//
//  BaiTap9ViewController.swift
//  BaiTap BaiTapAutoLAyout
//
//  Created by MacBook Pro on 7/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap9ViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet private weak var numberOfImageLabel: UILabel!
    @IBOutlet private weak var imageImageView: UIImageView!
    @IBOutlet private weak var descriptionImageLabel: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var commentButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    
    // MARK: - Properties
    private var location: Int = 0
    private var data: [Data] = [
        Data(nameImage: "image1", descriptionImage: "Chú mèo mướp không lớn lắm, bộ lông mượt như nhung. Đầu chú tròn và nhỏ. Ai làm gì thì hai tai dỏng lên nghe ngóng. Em thích nhất đôi mắt tròn sáng ngời như hai viên ngọc."),
        Data(nameImage: "image2", descriptionImage: "Chú mèo có bộ lông tuyệt đẹp màu vàng óng. Đầu chú to như cái xuyến. Hai tai chú vểnh lên lúc nào cũng như nghe ngóng mọi sự việc.Chú có đôi mắt mầu vàng long lanh như hai giọt nước, buổi tối chú nhìn mọi vật rất rõ. Bạn nhìn mũi chú bé thế thôi nhưng cực thính, mũi chú thính vì chú có bộ ria em coi bộ ria của chú như cái ra đa. Mồm chú to nên lúc ăn cái gì cũng kêu meo meo. Chú khoác trên mình một bộ lông mượt óng."),
        Data(nameImage: "image3", descriptionImage: "con mèo chỉ bằng chai nước khoáng nhỏ. Nay nó đã to phải bằng cái chai Cô-ca đại rồi. Toàn thân chú được bao phủ một màu vàng, điểm thêm và vệt trắng làm cho chiếc áo của chú lại càng thêm đẹp. Cái đầu của chú to hơn quả bóng ten-nít một chút. Đôi mắt tròn như hai hòn bi ve và sáng như đèn pha. Cái mũi phơn phớt hồng, lúc nào cũng ươn ướt như người bị cúm sổ mũi vậy"),
        Data(nameImage: "image4", descriptionImage: "con mèo chỉ bằng chai nước khoáng nhỏ. Nay nó đã to phải bằng cái chai Cô-ca đại rồi. Toàn thân chú được bao phủ một màu vàng, điểm thêm và vệt trắng làm cho chiếc áo của chú lại càng thêm đẹp. Cái đầu của chú to hơn quả bóng ten-nít một chút. Đôi mắt tròn như hai hòn bi ve và sáng như đèn pha. Cái mũi phơn phớt hồng, lúc nào cũng ươn ướt như người bị cúm sổ mũi vậy"),
        Data(nameImage: "image5", descriptionImage: "con mèo chỉ bằng chai nước khoáng nhỏ. Nay nó đã to phải bằng cái chai Cô-ca đại rồi. Toàn thân chú được bao phủ một màu vàng, điểm thêm và vệt trắng làm cho chiếc áo của chú lại càng thêm đẹp. Cái đầu của chú to hơn quả bóng ten-nít một chút. Đôi mắt tròn như hai hòn bi ve và sáng như đèn pha. Cái mũi phơn phớt hồng, lúc nào cũng ươn ướt như người bị cúm sổ mũi vậy")]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configButton()
        cofigDescription()
    }
    
    // MARK: - Private functions
    private func cofigDescription() {
        if data[0].nameImage.count == 0 {
            numberOfImageLabel.text = ""
            return
        }
        numberOfImageLabel.text = "1 / \(data.count)"
        imageImageView.image = UIImage(named: data[0].nameImage)
        descriptionImageLabel.text = data[0].descriptionImage
    }
    
    private func configButton() {
        likeButton.layer.cornerRadius = 5
        commentButton.layer.cornerRadius = 5
        shareButton.layer.cornerRadius = 5
    }
    
    // MARK: - @IBActions
    @IBAction private func nextButtonTouchInside(_ sender: UIButton) {
        location += 1
        if location == data.count {
            location = 0
        }
        numberOfImageLabel.text = "\(location + 1) / \(data.count)"
        imageImageView.image = UIImage(named: data[location].nameImage)
        descriptionImageLabel.text = data[location].descriptionImage
    }
    
    @IBAction private func backButtonTouchUpInside(_ sender: UIButton) {
        location -= 1
        if location < 0 {
            location = data.count - 1
        }
        numberOfImageLabel.text = "\(location + 1) / \(data.count)"
        imageImageView.image = UIImage(named: data[location].nameImage)
        descriptionImageLabel.text = data[location].descriptionImage
    }
}
