//
//  MyClass.swift
//  BaiTapCustomVIew
//
//  Created by NganHa on 7/3/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol MyClassDelegate : class {
    func view(_ view: MyClass, needsPerform action: MyClass.Action)
}

final class MyClass: UIView {
    
    // MARK: - Properties
    private lazy var usernameLabel: UILabel = UILabel()
    private lazy var imageView: UIImageView = UIImageView()
    private var tap = UITapGestureRecognizer()
    private var people: People?
    private var index: Int?
    weak var delegate: MyClassDelegate?
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(frame: CGRect, people: People? = nil, index: Int? = nil) {
        self.init(frame: frame)
        configView()
        self.people = people
        self.index = index
        updateView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private functions
    private func configView() {
        // add avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView = UIImageView(image: UIImage(named: "abc.png"))
        imageView.frame = frame
        imageView.contentMode = .scaleToFill
        addSubview(imageView)
        //add name
        usernameLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        usernameLabel.backgroundColor = .systemPink
        usernameLabel.textColor = .white
        usernameLabel.textAlignment = .center
        self.isUserInteractionEnabled = true
        tap = UITapGestureRecognizer(target: self, action: #selector(clickImage))
        self.addGestureRecognizer(tap)
        addSubview(usernameLabel)
    }

    private func updateView() {
        guard let people = people else { return }
        usernameLabel.text = people.username
        imageView.image = UIImage(named: people.image)
    }
    
    //MARK: - Objc functions
    @objc private func clickImage() {
        guard let index = index else { return }
        delegate?.view(self, needsPerform: .didTapImage(index: index))
    }
}

//MARK: -Extension
extension MyClass {
    enum Action {
        case didTapImage(index: Int)
    }
}
