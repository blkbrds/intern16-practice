import UIKit

protocol MyAvatarDelegate: class {
    func viewPerson(_ person: Avatar, str: String)
}

class Avatar: UIView {
    var createName = {() -> UILabel in
        let name = UILabel()
        name.textAlignment = .center
        name.backgroundColor = .red
        return name
    }()

    var createImage = {() -> UIImageView in
        let img = UIImageView()
        img.image = UIImage(named: "download")
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        return img
    }()

    weak var delegate: MyAvatarDelegate?

    @objc func tapPerson(_ sender: Any) {
        delegate?.viewPerson(self, str: createName.text!)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(createImage)
        self.addSubview(createName)
        createImage.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        createName.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapPerson(_:)))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
