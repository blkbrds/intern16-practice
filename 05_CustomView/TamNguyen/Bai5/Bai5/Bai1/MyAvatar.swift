import UIKit

// MARK: - Protocol
protocol MyAvatarDelegate: class {
    func myAvatar(_ myAvatar: MyAvatar, didSelect index: Int)
}

final class MyAvatar: UIView {

    // MARK: - Properties
    var x: CGFloat = 40
    var y: CGFloat = 80
    weak var delegate: MyAvatarDelegate?

    struct Avatar {
        var name: String
        var imageView: UIImageView
    }

    let avatars: [Avatar] = [
        Avatar(name: "1", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "2", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "3", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "4", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "5", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "6", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "7", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "8", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "9", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "10", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "11", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "12", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "13", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "14", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "15", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "16", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "17", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "18", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "19", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "20", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "21", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "22", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "23", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "24", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "25", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "26", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "27", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "28", imageView: UIImageView(image: UIImage(named: "download"))),
        Avatar(name: "29", imageView: UIImageView(image: UIImage(named: "download"))),
    ]

    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configAvatar()
    }

    // MARK: - Private Methods
    private func configAvatar() {
        for index in 1...avatars.count {
            // Add user avatar
            let frame = CGRect(x: x, y: y, width: 100, height: 100)
            let userAvatarImageView = avatars[index - 1].imageView
            userAvatarImageView.frame = frame
            userAvatarImageView.contentMode = .scaleToFill
            addSubview(userAvatarImageView)

            // Add user name
            let userNameLabel = UILabel(frame: CGRect(x: x, y: y + 100, width: 100, height: 50))
            userNameLabel.text = avatars[index - 1].name
            userNameLabel.backgroundColor = .lightGray
            userNameLabel.textColor = .blue
            userNameLabel.textAlignment = .center
            addSubview(userNameLabel)

            // Add button
            let clickButton = UIButton(frame: CGRect(x: x, y: y, width: 100, height: 250))
            clickButton.backgroundColor = .clear
            clickButton.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
            addSubview(clickButton)
            x += 120
            if index % 3 == 0 {
                y += 160
                x = 40
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

    @objc private func buttonDidClick() {
        print("abc")
        delegate?.myAvatar(self, didSelect: 10)
    }
}
