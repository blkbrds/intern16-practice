
import UIKit

class Baitap1002: UIViewController {
    
    // MARK: - Propeties
    private var indexUser: Int = 0
    var listUser: [User] = [User(nameUser: "Name1", avatarUser: "avatar"), User(nameUser: "Name2", avatarUser: "avatar"), User(nameUser: "Name3", avatarUser: "avatar"), User(nameUser: "Name4", avatarUser: "avatar"), User(nameUser: "Name5", avatarUser: "avatar"), User(nameUser: "Name6", avatarUser: "avatar"), User(nameUser: "Name7", avatarUser: "avatar"), User(nameUser: "Name8", avatarUser: "avatar"), User(nameUser: "Name9", avatarUser: "avatar"), User(nameUser: "Name10", avatarUser: "avatar"), User(nameUser: "Name11", avatarUser: "avatar"), User(nameUser: "Name12", avatarUser: "avatar"), User(nameUser: "Name13", avatarUser: "avatar"), User(nameUser: "Name14", avatarUser: "avatar"), User(nameUser: "Name15", avatarUser: "avatar"), User(nameUser: "Name16", avatarUser: "avatar"), User(nameUser: "Name17", avatarUser: "avatar"), User(nameUser: "Name18", avatarUser: "avatar"), User(nameUser: "Name19", avatarUser: "avatar"), User(nameUser: "Name20", avatarUser: "avatar"), User(nameUser: "Name21", avatarUser: "avatar"), User(nameUser: "Name22", avatarUser: "avatar"), User(nameUser: "Name23", avatarUser: "avatar"), User(nameUser: "Name24", avatarUser: "avatar"), User(nameUser: "Name25", avatarUser: "avatar"), User(nameUser: "Name26", avatarUser: "avatar"), User(nameUser: "Name27", avatarUser: "avatar"), User(nameUser: "Name28", avatarUser: "avatar"), User(nameUser: "Name29", avatarUser: "avatar"), User(nameUser: "Name30", avatarUser: "avatar")]
    let userDefault: UserDefaults = UserDefaults()
    var avatarItems: [Avatar] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        createListAvatar()
    }
    
    // MARK: - Private functions
    private func createListAvatar() {
        let widthSizeScrollView: CGFloat = UIScreen.main.bounds.width
        let sizeContentOnLine: CGFloat = 100 * 3 + 20 * 2
        var originX: CGFloat = CGFloat(Float((widthSizeScrollView - sizeContentOnLine) / 2)) - 120
        var originY: CGFloat = 20
        let uiScrollView: UIScrollView = UIScrollView(frame: view.frame)
        uiScrollView.backgroundColor = .green
        view.addSubview(uiScrollView)
        for index in 0..<listUser.count {
            if originX < CGFloat(Float(widthSizeScrollView - (widthSizeScrollView - sizeContentOnLine) / 2)) - 120 {
                originX += 120
            } else {
                originX = CGFloat(Float((UIScreen.main.bounds.width - sizeContentOnLine) / 2))
                originY += 150
            }
            avatarItems.append(Avatar(frame: CGRect(x: originX, y: originY, width: 100, height: 130), user: listUser[index], index: index))
            avatarItems[index].delegate = self
            uiScrollView.addSubview(avatarItems[index])
        }
        uiScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: avatarItems[listUser.count - 1].frame.maxY + 20)
    }
}

// MARK: - Extension
extension Baitap1002: AvatarDelegate {
    func view(_ person: Avatar, needsPerform: Avatar.Action) {
        switch needsPerform {
        case .tap(let index):
            indexUser = index
            userDefault.set(listUser[index].nameUser, forKey: "name")
            userDefault.set(listUser[index].avatarUser, forKey: "avatar")
            let profileView = ProfileViewController()
            profileView.delegate = self
            navigationController?.pushViewController(profileView, animated: true)
        }
    }
}

extension Baitap1002: ProfileViewControllerDelegate {
    func view(_ controller: ProfileViewController, needsPerform action: ProfileViewController.Action) {
        switch action {
        case .tap:
            guard let username = userDefault.value(forKey: "newName") as? String else { return }
            listUser[indexUser].nameUser = username
            avatarItems[indexUser].nameLabel.text =  username
        }
    }
}
