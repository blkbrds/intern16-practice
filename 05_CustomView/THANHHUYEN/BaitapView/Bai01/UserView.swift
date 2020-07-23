//  UserView.swift

import UIKit

protocol UserViewDelegate: class {
    func userView(view: UserView, needsPerform action: UserView.Action)
}

class UserView: UIView {

    // MARK: - Properties private
    private var userAvatarImageView = UIImageView()
    private var userNameLabel = UILabel()
    
    // MARK: - delegate
    weak var delegate: UserViewDelegate?

    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    // MARK: - private func
    private func setupUI() {
        // Add user avatar
        userAvatarImageView = UIImageView(frame: CGRect(x: 5, y: 10, width: 110, height: 130))
        userAvatarImageView.image = UIImage(named: "user")
        userAvatarImageView.contentMode = .scaleToFill
        addSubview(userAvatarImageView)

        // Add user name
        userNameLabel.frame = CGRect(x: 5, y: 150 , width: 110, height: 30)
        userNameLabel.textAlignment = .center
        userNameLabel.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        userNameLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        userNameLabel.text = " 1"
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        addSubview(userNameLabel)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        tapGestureRecognizer.name = userNameLabel.text
        userNameLabel.isUserInteractionEnabled = true
        userNameLabel.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: - func public
    func updateUI(imageName: String = "", name: String) {
        userAvatarImageView.image = UIImage(named: imageName)
        userNameLabel.text = name
    }
    
    // MARK: - objc
    @objc func tapGesture(_ sender: UITapGestureRecognizer) {
        delegate?.userView(view: self, needsPerform: .didTapImage(nameLabel: userNameLabel.text ?? ""))
        }

    // MARK: - required
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UserView {
    enum Action {
        case didTapImage(nameLabel : String)
    }
}
