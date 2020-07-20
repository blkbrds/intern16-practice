//
//  Bai9ViewController.swift
//  Autolayout-Bai6
//
//  Created by Abcd on 7/12/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai9ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var numberTitleLabel: UILabel!
    @IBOutlet weak var nextImageButton: UIButton!
    @IBOutlet weak var backImageButton: UIButton!
    @IBOutlet weak var ImageScrollView: UIScrollView!
    @IBOutlet weak var contentLabel: UILabel!
    // MARK: - Properties
    private var value: Int = 1
    private let images = [1,2,3,4,5,6,7,8,9,10]
    private let contents: [String] = ["Vòng 35, MU đã có cơ hội vượt lên Top 3 nhưng thầy trò Solskjaer lại không tận dụng được. Ngoại hạng Anh chỉ còn 3 vòng nữa là kết thúc nên “Quỷ đỏ” có thể phải trả giá rất đắt cho sơ suất của mình",
                                      "Vòng 36, Chelsea tiếp tục là đội ra quân sớm nhất trong ba đội đang cạnh tranh suất dự cúp C1. “The Blues” vừa để thua 0-3 ở vòng trước nên nhiều người lo ngại cho thầy trò HLV Lampard dù đối thủ của họ là Norwich City đã chắc chắn xuống hạng",
                                      "Thực tế, Chelsea cũng cực kỳ vất vả khi đối mặt với hàng phòng ngự dày đặc của “Những chú chim hoàng yến”. Đã có lúc thời gian họ cầm bóng lên tới 80% nhưng lại không thể tìm đường vào khung thành đối phương",
                                      "Rất may cho Lampard là Olivier Giroud kịp thời tỏa sáng với pha đánh đầu cận thành ở phút 45+3. Nhọc nhằn có được 3 điểm, Chelsea củng cố vững chắc vị trí thứ ba của mình trên bảng xếp hạng với 63 điểm",
                                      "Họ đã tạo ra khoảng cách 4 điểm với hai đội xếp liền sau là Leicester City và MU. Đây là áp lực không nhỏ cho hai kẻ bám đuổi trước giờ xung trận. Leicester City được dự đoán sẽ gặp nhiều khó khăn khi phải đối đầu với Sheffield United, một đội bóng cũng đang mơ về suất dự cúp châu Âu",
                                      "Trong khi đó, MU sẽ phải làm khách của Crystal Palace với những lo ngại về hàng thủ. Maguire và Lindelof đều đang có phong độ không tốt trong khi vị trí hậu vệ cánh trái còn đang bỏ ngỏ khi Shaw và Williams đều chấn thương ở lượt đấu trước",
                                      "Dù sắp kết thúc nhưng những ẩn số trong cuộc đua giành vé dự Champions League mùa tới tại Ngoại hạng Anh vẫn chưa hết. Vòng tới, Chelsea sẽ phải đối đầu với nhà vô địch Liverpool trong khi Leicester và MU còn đụng độ ở vòng cuối cùng",
                                      "Bởi vậy, cả ba đội bóng này vẫn còn nguyên cơ hội dù hiện tại, Chelsea đã nhỉnh hơn một chút sau khi giành chiến thắng ở vòng 36",
                                      "Bảng xếp hạng Ngoại hạng Anh sau trận Chelsea - Norwich City",
                                      "Cực nóng bảng xếp hạng Ngoại hạng Anh: Chelsea bứt tốc, MU kém mấy điểm"]
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configScrollView()
    }
    private func configScrollView() {
        ImageScrollView.contentSize = CGSize(width: ImageScrollView.bounds.width * CGFloat(contents.count), height: ImageScrollView.bounds.height)
        for i in 0...9 {
            let imageView = UIImageView(image: UIImage(named: String(i + 1)))
            imageView.frame = CGRect(x: ImageScrollView.bounds.width * CGFloat(i), y: 0, width: ImageScrollView.bounds.width, height: ImageScrollView.bounds.height)
            ImageScrollView.addSubview(imageView)
        }
    }
    // MARK: - Function
    func setUpView() {
        contentLabel.text = contents[0]
        numberTitleLabel.text = "\(value)/10"
    }
    @IBAction func nextPressed(_ sender: UIButton) {
        value %= 10
        value += 1
        UIView.animate(withDuration: 1, animations: {
            self.ImageScrollView.contentOffset = CGPoint(x: self.ImageScrollView.bounds.width * CGFloat(self.value - 1) , y: 0)
        })
        contentLabel.text = contents[value - 1]
        numberTitleLabel.text = "\(value)/10"
        
    }
    @IBAction func backPressed(_ sender: UIButton) {
        if value == 1 {
            value = 10
            UIView.animate(withDuration: 1, animations: {
                self.ImageScrollView.contentOffset = CGPoint(x: self.ImageScrollView.bounds.width * CGFloat(self.value - 1) , y: 0)
            })
            contentLabel.text = contents[value - 1]
            numberTitleLabel.text = "\(value)/10"
        } else {
            value -= 1
            UIView.animate(withDuration: 1, animations: {
                self.ImageScrollView.contentOffset = CGPoint(x: self.ImageScrollView.bounds.width * CGFloat(self.value - 1) , y: 0)
            })
            contentLabel.text = contents[value - 1]
            numberTitleLabel.text = "\(value)/10"
        }
    }
}
