import UIKit

func fibonacci(n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n <= 2 {
        return 1
    } else {
        return fibonacci(n: n - 1) + fibonacci(n: n - 2)
    }
}

func sum(n: Int) -> Int {
    var sum = 0
    for i in 0..<n {
        sum += fibonacci(n: i)
    }
    return sum
}

func listFibonacci(lessThan n: Int) -> [Int] {
    var danhsach = [Int]()
    for i in 0..<n {
        danhsach.append(fibonacci(n: i))
    }
    return danhsach
}

let gioiHan = 5
// Tổng va danh sach của 5 số Fibonacy đầu tiên
print("Tong \(gioiHan) so fibonacci: \(sum(n: gioiHan))")
print("Danh sach \(gioiHan) so fibonacci dau tien: \(listFibonacci(lessThan: gioiHan))")

// sin(x), cos(x) bằng công thức Chuỗi Taylor
func tinhGiaiThua(n: Int) -> Int {
    if n == 0 || n == 1 {
        return 1
    } else {
        return n * tinhGiaiThua(n: n - 1)
    }
}

// print(giaithua(n: 5))
func sinX(goc: Double) -> Double {
    let saiso = 0.00001
    var sochuan = 1.0
    var n = 0
    var sinX = 0.0
    // Converting degrees to radian
    let gocRad = goc * .pi / 180
    while sochuan > saiso {
        sochuan = pow(gocRad, Double((2 * n + 1))) / Double(tinhGiaiThua(n: 2 * n + 1))
        if n % 2 == 0 {
            sinX += sochuan
        } else {
            sinX -= sochuan
        }
        n += 1
    }
    return sinX
}

func cosX(goc: Double) -> Double {
    let saiso = 0.00001
    var sochuan = 1.0
    var n = 0
    var cosX = 0.0
    // Converting degrees to radian
    let gocRad = goc * .pi / 180
    while sochuan > saiso {
        sochuan = pow(gocRad, Double((2 * n))) / Double(tinhGiaiThua(n: 2 * n))
        if n % 2 == 0 {
            cosX += sochuan
        } else {
            cosX -= sochuan
        }
        n += 1
    }
    return cosX
}

print("Sin(45) = \(sinX(goc: 45))")
print("Cos(0) = \(cosX(goc: 0))")

// danh sach so hoan hao :  tổng các ước của nó bằng chính nó.
func tongBinhPhuong(n: Int) -> Int { // Tong binh phuong tung so trong mot so
    var temp = n
    var sum = 0
    var soLe = 0
    while temp > 0 {
        soLe = temp % 10
        sum += soLe * soLe
        temp = temp / 10
    }
    return sum
}

func isHappy(n: Int) -> Bool {
    var tempArray = [Int]()
    var temp = n
    while(temp > 1 && !tempArray.contains(temp)) {
        tempArray.append(temp)
        temp = tongBinhPhuong(n: temp)
        if temp == 1 {
            return true
        }
    }
    return false
    
}

func lietkeHP(n: Int) -> [Int] {
    var danhsach = [Int]()
    for i in 0..<n {
        if isHappy(n: i) {
            danhsach.append(i)
        }
    }
    return danhsach
}

print("Danh sach số hạnh phúc bé hơn 100 \(lietkeHP(n: 100))")

