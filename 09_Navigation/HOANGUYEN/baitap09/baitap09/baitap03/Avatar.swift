
import UIKit
// MARK: - Protocol
protocol AvatarDelegate: class {
    func view(_ person: Avatar, needsPerform action: Avatar.Action)
}

final class Avatar: UIView {
    
    // MARK: - Properties
    var index: Int?
    var nameLabel: UILabel = {() -> UILabel in
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        label.textAlignment = .center
        label.backgroundColor = .blue
        return label
    }()
    var avatarImage = {() -> UIImageView in
        let img = UIImageView()
        img.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        img.image = UIImage(named: "avatar")
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        return img
    }()
    weak var delegate: AvatarDelegate?
    
    // MARK: - Objc Function
    @objc func tapPerson(_ sender: Any) {
        if let index = index {
            delegate?.view(self, needsPerform: .tap(index: index) )
        }
    }
    
    // MARK: - Initialize
    init(frame: CGRect, user: User, index: Int) {
        super.init(frame: frame)
        self.index = index
        self.addSubview(avatarImage)
        self.addSubview(nameLabel)
        nameLabel.text = user.nameUser
        avatarImage.image = UIImage(named: user.avatarUser)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapPerson(_:)))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Avatar {
    enum Action {
        case tap(index: Int)
    }
}
