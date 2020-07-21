//
//  EditViewController.swift
//  Bai2Navigation
//
//  Created by Trung Le D. on 7/21/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "EDIT"
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButton))
        let done = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(doneButton))
              navigationItem.rightBarButtonItems = [cancel,done]
    }

    @objc func cancelButton() {
        print("cancel")
    }
    @objc func doneButton() {
        print("Done")
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
