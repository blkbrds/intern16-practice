
import UIKit

final class BaiTap01: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    // MARK: - Private Methods
    private func configUI() {
        // Add user avatar
        // Xd view con trong view cha
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        // Tao doi tuong view
        let userAvatarImageView = UIImageView(image: UIImage(named: "img_avatar_01"))
        // Gan gia tri cho thuoc tinh view
        userAvatarImageView.frame = frame
        userAvatarImageView.contentMode = .scaleToFill
        //add view vao superview
        view.addSubview(userAvatarImageView)

        // Add user name
        let userNameLabel = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        userNameLabel.text = "User Name"
        userNameLabel.backgroundColor = .lightGray
        userNameLabel.textColor = .blue
        view.addSubview(userNameLabel)

        // Add button
        let clickButton = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        clickButton.backgroundColor = .clear
        clickButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
        view.addSubview(clickButton)
    }

    @objc private func buttonTouchUpInside() {
        print("Button is locked!!!")
    }
}
