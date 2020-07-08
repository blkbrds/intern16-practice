//
//  BaiTap1ViewController.swift
//  BaiTapView
//
//  Created by NganHa on 6/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class BaiTap1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(addUserAvatar(withImage: "avatar.png"))
        view.addSubview(addUsername(withName: "Name"))
    }
    
    // create an avatar
    func addUserAvatar(withImage image: String) -> UIImageView {
        let frame = CGRect(x: 30, y: 30, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleAspectFill
        userAvatar.clipsToBounds = true
        //view.addSubview(userAvatar)
        return userAvatar
         }
         
         func addUsername(withName text : String) -> UILabel {
             let username = UILabel(frame: CGRect(x: 30, y: 130, width: 100, height: 30))
             username.text  = text
             username.textAlignment = .center
             username.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
             username.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
             //view.addSubview(username)
             return username
         }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
