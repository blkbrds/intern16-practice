import UIKit

func findChild(_ parent: String, _ child: String) -> Int {
   return parent.components(separatedBy: child).count - 1
}

findChild("abaaaaabbbbaaabababaabababa", "ab")


