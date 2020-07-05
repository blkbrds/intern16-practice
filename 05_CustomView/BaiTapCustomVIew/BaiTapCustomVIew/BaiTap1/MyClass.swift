//
//  MyClass.swift
//  BaiTapCustomVIew
//
//  Created by NganHa on 7/3/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol MyAvatarDelegate : class {
    func userView(_ person: MyClass, nameLabel name: String)
}
class MyClass: UIView {
    
    // MARK: - Propeties
    var username: UILabel?
    var image: UIImageView?
    var tap = UITapGestureRecognizer()
    var people: People?
    weak var delegate: MyAvatarDelegate?
    
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
        image = UIImageView(image: UIImage(named: "abc.png"))
        image?.frame = frame
        image?.contentMode = .scaleToFill
        addSubview(image!)
        
        //add name
        username = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        username?.backgroundColor = .systemPink
        username?.textColor = .white
        username?.textAlignment = .center
        self.isUserInteractionEnabled = true
        tap = UITapGestureRecognizer(target: self, action: #selector(clickImage))
        self.addGestureRecognizer(tap)
        addSubview(username!)
        
    }
    @objc func clickImage() {
        delegate?.userView(self, nameLabel: self.username?.text ?? "no name")
    }
    
}
