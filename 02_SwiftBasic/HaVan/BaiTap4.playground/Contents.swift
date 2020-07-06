import Foundation
//MARK: fibonacci

func fiboN(to n: Int) -> Int {
    if n == 0 || n == 1 {
        return n
    } else {
        return fiboN(to: n - 2) + fiboN(to: n - 1)
    }
}

func tong(to n: Int) -> Int {
    var s = 0
    for i in 0...n {
        s += fiboN(to: i)
    }
    return s
}

func listFibonaciNumber(lowerThan n: Int) -> [Int] {
    var fiboNumbers = [Int]()
    for i in 0...n {
        fiboNumbers.append(fiboN(to: i))
    }
    return fiboNumbers
}

//MARK: Sinx + Cosx
func sumNumbersTaylor(withRadian x: Float, limitNumber n: Int) -> Float {
    var temp:Float = 1.0
    for i in 1...2 * n + 1 {
        temp = temp * x / Float(i)
    }
    if n % 2 == 0 {
        return temp
    }
    return temp * -1
}

func tinhSin(with x: Float) -> Float {
    var n: Int = 0
    var sin: Float = 0.0
    while abs(sumNumbersTaylor(withRadian: x, limitNumber: n)) > 0.00001 {
        sin += sumNumbersTaylor(withRadian: x, limitNumber: n)
        n += 1
    }
    return sin
}

func tinhCos(with x: Float) -> Float {
    return sqrt(1 - powf(tinhSin(with: x), 2))
}

//MARK: số hạnh phúc
//Kiểm tra số chữ số có trong 1 số
func kiemTraChuSo(with num: Int) -> Int {
    var temp = num
    var count = 0
    while temp >= 10 {
        temp = temp / 10
        count += 1
    }
    count += 1
    return count
}

//Kiểm tra 1 số có là số hạnh phúc hay không
func isHappy(with num: Int) -> Bool {
    let soChuSo = kiemTraChuSo(with: num)
    var sum1 = 0
    var sum2 = 0
    var temp = num
    // nếu số chữ số của số đó % 2 != 0, thì false
    if soChuSo % 2 == 1 {
        return false
    } else {
        // cộng 1/2 số chữ số đầu của số đó
        for _ in 1...soChuSo / 2 {
            sum1 += temp % 10
            temp = temp / 10
        }
        // cộng 1/2 số chữ số sau của số đó
        for _ in soChuSo / 2 + 1...soChuSo {
            sum2 += temp % 10
            temp = temp / 10
        }
    }
    if sum1 == sum2 {
        return true
    } else {
        return false
    }
}

func listHappyNumbers() -> [Int] {
    var listNums: [Int] = []
    for i in 0...10000 {
        if isHappy(with: i) {
            listNums.append(i)
        }
    }
    return listNums
}

//MARK: kết quả của bài tập
print("tong 10 so fibo: \(tong(to: 10))")
print("liet ke 10 số fibo đầu tiên \(listFibonaciNumber(lowerThan: 10)) ")
print("sin(0) = \(tinhSin(with: 0))")
print("cos(0) \(tinhCos(with: 0))")
print("Số hạnh phúc bé hơn 10000 là : \(listHappyNumbers())")
