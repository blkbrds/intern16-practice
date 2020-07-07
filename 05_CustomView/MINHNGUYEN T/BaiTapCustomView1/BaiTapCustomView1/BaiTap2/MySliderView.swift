//
import UIKit
// MARK: - Protocol
protocol SliderViewDelegate: class {
    func changeValue(value: Int)
}

class MySliderView: UIView {
    // MARK: - IBOutlet Properties
    @IBOutlet weak var blueImageView: UIImageView!
    @IBOutlet weak var whiteImageView: UIImageView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var thumbView: UIView!
    weak var delegate: SliderViewDelegate?
    var value: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Overide Funtion
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: whiteImageView)
        if location!.y < whiteImageView.bounds.minY {
            thumbView.center.y = whiteImageView.bounds.minY
        } else if location!.y > whiteImageView.bounds.maxY {
            thumbView.center.y = whiteImageView.bounds.maxY
        } else {
            thumbView.center.y = location!.y
        }
        blueImageView.frame = CGRect(x: blueImageView.frame.origin.x, y: thumbView.center.y, width: blueImageView.frame.width, height: whiteImageView.frame.height - thumbView.center.y)
        let number = Int((blueImageView.frame.height / whiteImageView.frame.height) * 100)
        valueLabel.text = String(number)
        delegate?.changeValue(value: number)
    }
    
    // MARK: - Public Funtion
    func setView() {
        guard let num = value else { return }
        let newHeight = (whiteImageView.bounds.height * CGFloat(num)) / 100
        let newY = whiteImageView.bounds.height - newHeight
        blueImageView.frame = CGRect(x: blueImageView.frame.origin.x, y: newY, width: blueImageView.frame.width, height: newHeight)
        thumbView.center.y = newY
        valueLabel.text = String(num)
    }
}
