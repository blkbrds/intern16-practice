//
//  ExerciseOneViewController.swift
//  BaiTap11
//
//  Created by hieungq on 7/13/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class ExerciseOneViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var datas: [String] = ["Về giao diện của ứng dụng iOS, việc hiển thị một danh sách được sử dụng rất nhiều. Hầu như đó là cốt lõi trong việc thiết kế giao diện của ứng dụng. Để hiển thị danh sách thì với iOS bạn sẽ phải dùng tới UITableView. Chúng ta nắm sơ về nó một chút: Table View hiển thị danh sách dữ liệu thành các hàng (row).", "Table View được tạo bởi 1 hoặc nhiều section, mỗi section sở hữu nhiều row.Section là số chỉ mục trong table, trong khi row là số chỉ mục trong section.Mỗi section có thể có section header và section footer Table view có 2 style: plain và grouped.", "UITableView là subclass của UIScrollView, nên nó cho phép người dùng cuộn table. Tuy nhiên UITableView chỉ cho phép cuộc theo chiều dọc.", "Để cho dễ hiểu hơn thì từ phần này chúng ta sẽ kết hợp demo code với phần lý thuyết. Vì TableView dùng để hiển thị một danh sách lên trên giao diện của ứng dụng iOS. Nên bài demo chúng ta sẽ hiển thị danh sách học sinh lên màn hình.Tạo project không sử dụng Storyboard, để có thể hiểu cách hoạt động của TableView kĩ hơn. Trong Stroryboard, nhiều thứ đã cài đặt sẵn và việc hiển thị 1 TableView lại rất đơn giản. Nếu bạn chưa biết tạo project không sử dụng Storyboard thì có thể tham khảo link sau:"]
    var selectedDatas: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configNavigationBar()
    }

    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITabelViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelectionDuringEditing = true
    }

    private func estimate(contentLabel: String) -> CGFloat {
        let size = CGSize.init(width: UIScreen.main.bounds.width - 16, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimateFrame = NSString(string: contentLabel).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 21)!], context: nil)
        return estimateFrame.height
    }

    private func configNavigationBar() {
        title = "Home"
        turnOffEditingMode()
    }

    @objc func turnOnEditingMode() {
        tableView.isEditing = true
        tableView.allowsSelection = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEditingMode))
        navigationItem.rightBarButtonItem = doneButton

        let leftButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteSelectedCell))
        navigationItem.leftBarButtonItem = leftButton
    }

    @objc func turnOffEditingMode() {
        tableView.isEditing = false
        tableView.allowsSelection = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEditingMode))
        navigationItem.rightBarButtonItem = editButton

        let leftButton = UIBarButtonItem(title: "Delete All", style: .plain, target: self, action: #selector(deleteAllCell))
        navigationItem.leftBarButtonItem = leftButton

    }

    @objc func deleteAllCell() {
        if datas.count != 0 {
            datas.removeAll()
            tableView.reloadData()
        }
    }

    @objc func deleteSelectedCell() {
        selectedDatas.sort()
        if selectedDatas.count != 0 {
            for data in selectedDatas.reversed() {
                datas.remove(at: data)
            }
            selectedDatas.removeAll()
            tableView.reloadData()
        }
    }
}

extension ExerciseOneViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITabelViewCell", for: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return estimate(contentLabel: datas[indexPath.row]) + 10
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDatas.append(indexPath.row)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let index = selectedDatas.lastIndex(of: indexPath.row) {
            selectedDatas.remove(at: index)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            tableView.beginUpdates()
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: indexPath.section)], with: .right)
            self.datas.remove(at: indexPath.row)
            tableView.endUpdates()
        }
        delete.backgroundColor = UIColor.red

        let insert = UITableViewRowAction(style: .default, title: "Insert") { (action, indexPath) in
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: indexPath.section)], with: .left)
            self.datas.insert("hello Swift Swift  Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift", at: indexPath.row + 1)
            tableView.endUpdates()
        }
        insert.backgroundColor = UIColor.green

        return [delete, insert]
    }
}
