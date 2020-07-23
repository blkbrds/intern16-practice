// Bai02
// SliderView.swift

import UIKit

protocol SliderViewDelegate: class {
    func sliderView(value: CGFloat)
}

class SliderView: UIView {
    
    // MARK: - IBOulet private
    @IBOutlet private weak var thumbButton: UIButton!
    @IBOutlet private weak var blueImageView: UIImageView!
    @IBOutlet weak var whiteImageView: UIImageView!
    
    weak var delegate: SliderViewDelegate?
    var isChange = true
    var value: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - LifeCycle func
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - private function
    private func setUI() {
        thumbButton.layer.shadowOpacity = 3
        thumbButton.layer.opacity = 10
    }
    
    func updateUI() {
        //        thumbButton. = "\(Int(value))"
        thumbButton.setTitle("\(Int(value))", for: .normal)
    }
    
    // MARK: - touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let touch = touches.first
        guard let location = touch?.location(in: self) else { return }
        
        if location.y < whiteImageView.bounds.minY {
            thumbButton.center.y = whiteImageView.bounds.minY
        } else if location.y > whiteImageView.bounds.maxY {
            thumbButton.center.y = whiteImageView.bounds.maxY
        } else {
            thumbButton.center.y = location.y
        }
        
        blueImageView.frame = CGRect(x: blueImageView.frame.origin.x, y: thumbButton.center.y, width: blueImageView.frame.width, height: whiteImageView.frame.height - thumbButton.center.y)
        
        let number = Int((blueImageView.frame.height / whiteImageView.frame.height) * 100)
        thumbButton.setTitle(String(number), for: .normal)
        delegate?.sliderView(value: value)
    }
}
