import UIKit

class Bai01ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var scrollView: UIScrollView!

    // MARK: - Properties
    private let names: [String] = ["Username 1", "Username 2", "Username 3", "Username 4", "Username 5", "Username 6", "Username 7", "Username 8", "Username 9", "Username 10", "Username 11", "Username 12", "Username 13", "Username 14", "Username 15", "Username 16", "Username 17", "Username 18", "Username 19", "Username 20", "Username 21", "Username 22", "Username 23", "Username 24", "Username 25", "Username 26", "Username 27", "Username 28", "Username 29", "Username 30", "Username 31", "Username 32", "Username 33", "Username 34", "Username 35", "Username 36", "Username 37"]
    private let avatars: [String] = ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user", "user"]

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addUserView()
    }
    
    // MARK: - Func
    private func addUserView() {
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2500)
        let space: CGFloat = 10
        let widthScreen = scrollView.bounds.width

        let widthUserView: CGFloat = 110
        print(widthUserView)
        let heightUserView: CGFloat = 175
        var originX: CGFloat = 0
        var originY: CGFloat = space

        for index in 0..<names.count {
            let frame = CGRect(x: originX, y: originY, width: widthUserView, height: heightUserView)

            let avatar = UserView(frame: frame)
            avatar.delegate = self
            avatar.updateUI(imageName: avatars[index], name: names[index])
            scrollView.addSubview(avatar)

            // Tinh frame
            if originX + widthUserView > widthScreen - originX {
                // Thay doi y va x
                originY += heightUserView + space
                originX = space
            } else {
                originX += widthUserView + space
            }
        }
    }
}

// MARK: - Extension
extension Bai01ViewController: UserViewDelegate {
    func userView(view: UIView, avatar: String) {
        print(avatar)
    }
}
