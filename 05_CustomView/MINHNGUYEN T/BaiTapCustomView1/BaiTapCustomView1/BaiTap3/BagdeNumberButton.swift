import UIKit
class BagdeNumberButton: UIButton {
    
    enum PositionBadge {
        case bottomLeft
        case bottomCenter
        case bottomRight
        case centerRight
        case centerLeft
        case topLeft
        case topCenter
        case topRight
        
        func position(with frame: CGRect) -> CGPoint {
            switch self {
            case .topRight:
                return CGPoint(x: frame.maxX, y: frame.minY)
            case .topLeft:
                return CGPoint(x: frame.minX, y: frame.minY)
            case .topCenter:
                return CGPoint(x: frame.midX, y: frame.minY)
            case .bottomRight:
                return CGPoint(x: frame.maxX, y: frame.maxY)
            case .bottomLeft:
                return CGPoint(x: frame.minX, y: frame.maxY)
            case .bottomCenter:
                return CGPoint(x: frame.midX, y: frame.maxY)
            case .centerLeft:
                return CGPoint(x: frame.minX, y: frame.midY)
            case .centerRight:
                return CGPoint(x: frame.maxX, y: frame.midY)
            }
        }
    }
    // willset lấy gtri thiết lập truok
    //didset khỏi tạo lại gitri/ mặc định
    var isShowBadge: Bool = true {
        didSet {
            showBadge()
        }
    }
    
    var badgeNumber = 0 {
        didSet {
            updateLabel()
        }
    }
    
    lazy private var badgeLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = .orange
        label.textAlignment = .center
        label.textColor = .white
        label.frame.size = CGSize(width: 50, height: 30)
        label.numberOfLines = 0
        return label
    }()
    
    private func showBadge() {
        if isShowBadge {
            addSubview(badgeLabel)
        } else {
            badgeLabel.isHidden = true
        }
    }
    
    private func updateLabel() {
        if badgeNumber == 0 {
            badgeLabel.isHidden = true
        } else {
            badgeLabel.frame.size = CGSize(width: badgeLabel.frame.width, height: badgeLabel.frame.height)
            if badgeNumber >= 1 && badgeNumber <= 99{
                    badgeLabel.text = String(badgeNumber)
            } else if badgeNumber > 99 {
               badgeLabel.text = "99+"
            }
        }
    }
    
    func editPositionBagde(position: PositionBadge) {
        badgeLabel.center = position.position(with: bounds)
    }
}
