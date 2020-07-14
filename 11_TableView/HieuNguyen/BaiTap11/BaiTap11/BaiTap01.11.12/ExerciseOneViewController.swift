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
    var datas: [String] = ["Về giao diện của ứng dụng iOS, việc hiển thị một danh sách được sử dụng rất nhiều. Hầu như đó là cốt lõi trong việc thiết kế giao diện của ứng dụng. Để hiển thị danh sách thì với iOS bạn sẽ phải dùng tới UITableView. Chúng ta nắm sơ về nó một chút: Table View hiển thị danh sách dữ liệu thành các hàng (row).", "Table View được tạo bởi 1 hoặc nhiều section, mỗi section sở hữu nhiều row.Section là số chỉ mục trong table, trong khi row là số chỉ mục trong section.Mỗi section có thể có section header và section footer Table view có 2 style: plain và grouped.","UITableView là subclass của UIScrollView, nên nó cho phép người dùng cuộn table. Tuy nhiên UITableView chỉ cho phép cuộc theo chiều dọc.","Để cho dễ hiểu hơn thì từ phần này chúng ta sẽ kết hợp demo code với phần lý thuyết. Vì TableView dùng để hiển thị một danh sách lên trên giao diện của ứng dụng iOS. Nên bài demo chúng ta sẽ hiển thị danh sách học sinh lên màn hình.Tạo project không sử dụng Storyboard, để có thể hiểu cách hoạt động của TableView kĩ hơn. Trong Stroryboard, nhiều thứ đã cài đặt sẵn và việc hiển thị 1 TableView lại rất đơn giản. Nếu bạn chưa biết tạo project không sử dụng Storyboard thì có thể tham khảo link sau:"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITabelViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func estimate(contentLabel: String) -> CGFloat {
        let size = CGSize.init(width: UIScreen.main.bounds.width - 16, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimateFrame = NSString(string: contentLabel).boundingRect(with:  size, options: options, attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 21)!], context: nil)
        return estimateFrame.height
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
}
