import UIKit

var arrayTemp = [1, 2, 1, 3, 1]
for index in 0..<arrayTemp.count {
    if arrayTemp[index] == 1 {
        arrayTemp[index] = 2
    } else {
        continue
    }
}
print(arrayTemp)
