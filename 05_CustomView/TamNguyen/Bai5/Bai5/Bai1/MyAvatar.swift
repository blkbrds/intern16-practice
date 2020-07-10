import UIKit

protocol MyAvatarDelegate: class {
    func viewPerson(_ person: Avatar, str: String)
}

//MARK: - Properties
class Avatar: UIView {
    var userName = {() -> UILabel in
        let name = UILabel()
        name.textAlignment = .center
        name.backgroundColor = .red
        return name
    }()
    
    var imageAvatar = {() -> UIImageView in
        let img = UIImageView()
        img.image = UIImage(named: "download")
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        return img
    }()
    
    weak var delegate: MyAvatarDelegate?
    
    //MARK: - Private methods
    @objc private func tapPerson(_ sender: Any) {
        delegate?.viewPerson(self, str: userName.text!)
    }
    
    //MARK: - Override function
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageAvatar)
        self.addSubview(imageAvatar)
        imageAvatar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageAvatar.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapPerson(_:)))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
