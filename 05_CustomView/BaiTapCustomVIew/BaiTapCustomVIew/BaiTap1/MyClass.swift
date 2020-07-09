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
    
    // MARK: - Propeties
    var usernameLabel: UILabel?
    var imageView: UIImageView?
    private var tap = UITapGestureRecognizer()
    private var people: People?
    weak var delegate: MyClassDelegate?
    
    // MARK: - Initalize
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private functions
    private func configView(){
        // add avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView = UIImageView(image: UIImage(named: "abc.png"))
        imageView?.frame = frame
        imageView?.contentMode = .scaleToFill
        addSubview(imageView!)
        //add name
        usernameLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        usernameLabel?.backgroundColor = .systemPink
        usernameLabel?.textColor = .white
        usernameLabel?.textAlignment = .center
        self.isUserInteractionEnabled = true
        tap = UITapGestureRecognizer(target: self, action: #selector(clickImage))
        self.addGestureRecognizer(tap)
        addSubview(usernameLabel!)
    }
    
    //MARK: - Objc functions
    @objc func clickImage() {
       delegate?.view(self, needsPerform: .didTapImage(nameLabel: usernameLabel?.text ?? "no image"))
        }
}

//MARK: -Extension
extension MyClass {
    enum Action {
        case didTapImage(nameLabel: String)
    }
}
