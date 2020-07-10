//
//  BaiTap09VC.swift
//  BaiTap07
//
//  Created by hieungq on 7/3/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap09VC: UIViewController {

    @IBOutlet weak var pageNumLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var contentView: UILabel!
    
    struct Cat {
        var imageCat: UIImage
        var contentCat: String
    }
    
    var data:[Cat] = [
        Cat(imageCat: UIImage(named: "meo_anh_long_dai")!, contentCat: "Thân hình chắc khỏe. Đầu to tròn, mắt tròn sáng, tai ngắn.Chân ngắn khỏe, đuôi dài với lông dày.Bộ ngực sâu rộng tưởng kích thước chúng trung bình.Chúng có nhiều loại màu lông phổ biến là xám xanh, các màu khác như đen, trắng, đỏ, kem, xanh, nâu socola, tím hoa cà, nâu vàng hoa quế..."),
        Cat(imageCat: UIImage(named: "meo_ba_tu")!, contentCat: "Mèo này nổi bật lên với đáng yêu, nhỏ nhắn, xinh xắn. Chúng sở hữu bộ lông mượt, dài, khuôn mặt tẹt.Kích thước trung bình.Đầu to, mắt lớn, mũi nhỏ, tai nhỏ hình tam giác, thân hình săn chắc.Chúng có bộ lông dài, dày phủ khắp cơ thể và chân ngắn.        Bộ lông 2 lớp có nhiều màu khác nhau như xám xanh hoặc trắng đen, đỏ nâu...Mèo Ba Tư dễ tính, trầm tính và dịu ngọt, hiền lành chất phác, gần người. Mèo ba tư đẹp cần có yêu cầu là mũi tẹt, bé và mắt to. Mèo Ba Tư cũng không cần phải được thả cho đi chơi nhiều, nhốt chúng một chỗ cũng chẳng phiền hà gì cả (mặc dù nếu bạn thả ra thì chúng vẫn đi đấy, thậm chí đi lạc luôn cơ)."),
        Cat(imageCat: UIImage(named: "meo_muop")!, contentCat: "Lông tuy ngắn nhưng khá dày giúp giữ nhiệt cho cơ thể.Lông màu xám phổ biến ngoài ra còn có một số màu khác như đen, vàng, xám-trắng, xanh dương…        Chiếc đầu to tròn, mũi miệng ngắn, má rộng.Mắt tròn và to màu đồng phổ biến một số khác màu đen, xanh lá cây. Lông đuôi rất dày mà không xù (ngược với ALD)."),
        Cat(imageCat: UIImage(named: "meo_my_long_dai")!, contentCat: "Lông tuy ngắn nhưng khá dày giúp giữ nhiệt cho cơ thể.Lông màu xám phổ biến ngoài ra còn có một số màu khác như đen, vàng, xám-trắng, xanh dương…        Chiếc đầu to tròn, mũi miệng ngắn, má rộng.Mắt tròn và to màu đồng phổ biến một số khác màu đen, xanh lá cây. Lông đuôi rất dày mà không xù (ngược với ALD)."),
        Cat(imageCat: UIImage(named: "meo_my_long_ngan")!, contentCat: "Lông tuy ngắn nhưng khá dày giúp giữ nhiệt cho cơ thể.Lông màu xám phổ biến ngoài ra còn có một số màu khác như đen, vàng, xám-trắng, xanh dương…        Chiếc đầu to tròn, mũi miệng ngắn, má rộng.Mắt tròn và to màu đồng phổ biến một số khác màu đen, xanh lá cây. Lông đuôi rất dày mà không xù (ngược với ALD)."),
        Cat(imageCat: UIImage(named: "meo_tho_nhi_ky")!, contentCat: "Lông tuy ngắn nhưng khá dày giúp giữ nhiệt cho cơ thể.Lông màu xám phổ biến ngoài ra còn có một số màu khác như đen, vàng, xám-trắng, xanh dương…        Chiếc đầu to tròn, mũi miệng ngắn, má rộng.Mắt tròn và to màu đồng phổ biến một số khác màu đen, xanh lá cây. Lông đuôi rất dày mà không xù (ngược với ALD)."),
        Cat(imageCat: UIImage(named: "meo_vang")!, contentCat: "Lông tuy ngắn nhưng khá dày giúp giữ nhiệt cho cơ thể.Lông màu xám phổ biến ngoài ra còn có một số màu khác như đen, vàng, xám-trắng, xanh dương…        Chiếc đầu to tròn, mũi miệng ngắn, má rộng.Mắt tròn và to màu đồng phổ biến một số khác màu đen, xanh lá cây. Lông đuôi rất dày mà không xù (ngược với ALD)."),
        Cat(imageCat: UIImage(named: "meo_xiem")!, contentCat: "Lông tuy ngắn nhưng khá dày giúp giữ nhiệt cho cơ thể.Lông màu xám phổ biến ngoài ra còn có một số màu khác như đen, vàng, xám-trắng, xanh dương…        Chiếc đầu to tròn, mũi miệng ngắn, má rộng.Mắt tròn và to màu đồng phổ biến một số khác màu đen, xanh lá cây. Lông đuôi rất dày mà không xù (ngược với ALD)."),
        Cat(imageCat: UIImage(named: "meo-ald")!, contentCat: "Lông tuy ngắn nhưng khá dày giúp giữ nhiệt cho cơ thể.Lông màu xám phổ biến ngoài ra còn có một số màu khác như đen, vàng, xám-trắng, xanh dương…        Chiếc đầu to tròn, mũi miệng ngắn, má rộng.Mắt tròn và to màu đồng phổ biến một số khác màu đen, xanh lá cây. Lông đuôi rất dày mà không xù (ngược với ALD)."),
        Cat(imageCat: UIImage(named: "meo-tai-cup-scotland")!, contentCat: "Lông tuy ngắn nhưng khá dày giúp giữ nhiệt cho cơ thể.Lông màu xám phổ biến ngoài ra còn có một số màu khác như đen, vàng, xám-trắng, xanh dương…        Chiếc đầu to tròn, mũi miệng ngắn, má rộng.Mắt tròn và to màu đồng phổ biến một số khác màu đen, xanh lá cây. Lông đuôi rất dày mà không xù (ngược với ALD).")
    ]
    
    var currentPicture:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageNum()
        loadContent(numPicture: 0)
    }
    
    private func setupPageNum() {
        pageNumLabel.text = "\(currentPicture + 1)/\(data.count)"
    }
    
    private func loadContent(numPicture: Int) {
        imageView.image = data[numPicture].imageCat
        contentView.text = data[numPicture].contentCat
        currentPicture = numPicture
        setupPageNum()
    }

    @IBAction func nextButtonWasPressed(_ sender: Any) {
        if currentPicture == data.count - 1 { return }
        loadContent(numPicture: currentPicture + 1)
    }
    

    @IBAction func previousButtonWasPressed(_ sender: Any) {
        if currentPicture == 0 { return }
        loadContent(numPicture: currentPicture - 1)
    }
}
