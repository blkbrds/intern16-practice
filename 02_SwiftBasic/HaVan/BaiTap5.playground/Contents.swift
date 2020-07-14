import Foundation

func findChild(withChild child: String, inParent parent: String ) -> Int {
   return parent.components(separatedBy: child).count - 1
}

print(findChild(withChild: "ab", inParent: "babbbbbbbcab"))
