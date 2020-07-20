import UIKit

class Bai05ViewController: UIViewController {
    
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var thumbLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        thumbLabel.layer.borderWidth = 1
        thumbLabel.layer.cornerRadius = 5
        thumbLabel.layer.borderColor = UIColor.black.cgColor
        
        thumbLabel.text = "0 %"
        thumbLabel.clipsToBounds = true
        thumbLabel.center = CGPoint(x: thumbLabel.frame.midX, y: thumbLabel.frame.maxY)
        
        blueView.layer.cornerRadius = 5
        blueView.frame = CGRect(x: thumbLabel.frame.maxX, y: thumbLabel.frame.maxY, width: 0, height: 0)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        guard let location = touch?.location(in: whiteView) else { return }
        if location.y < whiteView.bounds.minY {
          thumbLabel.center.y = whiteView.bounds.minY
        } else if location.y > whiteView.bounds.maxY {
          thumbLabel.center.y = whiteView.bounds.maxY
        } else {
          thumbLabel.center.y = location.y
        }

        blueView.frame = CGRect(x: thumbLabel.frame.origin.x, y: thumbLabel.center.y, width: whiteView.frame.width , height: whiteView.frame.height - thumbLabel.center.y)
        let number = Int((blueView.frame.height / whiteView.frame.height) * 100)
        thumbLabel.text = String(number)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        guard let location = touch?.location(in: whiteView) else { return }
        if location.y < whiteView.bounds.minY {
          thumbLabel.center.y = whiteView.bounds.minY
        } else if location.y > whiteView.bounds.maxY {
          thumbLabel.center.y = whiteView.bounds.maxY
        } else {
          thumbLabel.center.y = location.y
        }

        blueView.frame = CGRect(x: thumbLabel.frame.origin.x, y: thumbLabel.center.y, width: whiteView.frame.width , height: whiteView.frame.height - thumbLabel.center.y)
        let number = Int((blueView.frame.height / whiteView.frame.height) * 100)
               thumbLabel.text = String(number)
    }
}
