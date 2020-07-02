import Foundation

// hàm tìm substring trong string
func findSub(_ parents: String, _ child: String) -> Int {
    var results: Int = 0
    var dem: Int = 0
    var i: Int = 0
    var checkSub: String = ""
    let count: Int = child.count
    // generic type
    var arr: Array<String> = []
    for i in parents {
        arr.append(String(i))
    }
    while i < arr.count - 1 {
        if dem < count {
            checkSub = checkSub + arr[i]
            dem += 1
            i += 1
        } else {
            if checkSub == child {
                results += 1
            }
            checkSub = ""
            i = i - dem + 1
            dem = 0
        }
    }
    return results
}

findSub("uiuiuahsfkauiuidfhdfh", "uiu")
