import Foundation

//Task 1 và 2 : Tính tổng và liệt kê n số Fibonacci đầu tiên
func fib(_ n: Int) -> (sum: Int, arrFibo: [Int]) {
    //Mang luu day Fibonacci
    var arr_Fibo: [Int] = [1,1]
    //Tổng của dãy fibonacci
    var sum: Int = 2
    if n <= 1 {
        if n == 1 {
            arr_Fibo = [1]
            sum = 1
            return (sum, arr_Fibo)
        } else {
            arr_Fibo = []
            sum = 0
            return (sum, arr_Fibo)
        }
    }
    for i in 2..<n {
        arr_Fibo.append(arr_Fibo[i - 1] + arr_Fibo[i - 2])
        sum = sum + arr_Fibo[i]
    }
    return (sum, arr_Fibo)
}

//Thuc thi task
fib(5)

// Task 3: Tính Sin(x) và Cos(x) theo Công thức chuỗi Taylor
var psAdd = {(_ t: Float, _ m: Float) -> Float in
    let addPs: Float = t / m
    return addPs
}

//Function tinh Sin va Cos
func sinCosTaylor(_ x: Float) -> (sinX: Float,cosX: Float) {
    var index = 1
    let X: Float = x * Float.pi / 180
    var current: Float = X
    var SS: Float = current
    var SC: Float = 1
    var crCos: Float = 1
    let addTu: Float = X * X
    while abs(current) > 0.000001 {
//tinh sin
        let addMauS: Float = (2 * Float(index) + 1) * (2 * Float(index))
        let addValueS: Float = psAdd(addTu,addMauS)
        current = current * addValueS
        SS = SS + powf(-1, (Float)(index)) * current
//tinh cos
        let adMauCos: Float = (2 * Float(index)) * (2 * Float(index) - 1)
        let adValueCos: Float = psAdd(addTu,adMauCos)
        crCos = crCos * adValueCos
        SC = SC + powf(-1, (Float)(index)) * crCos
//->end tinh cos
        index += 1
    }
    return (SS,SC)
}

sinCosTaylor(21)

// Task 4: In ra các số hạnh phúc < 10000

//Kiểm tra số hạnh phúc
func checkShp(_ s: Int ) -> Bool {
    let d: String = String(s)
    var S1: Int = 0
    var S2: Int = 0
    var index: Int = 1
    let count = d.count / 2
    for i in d {
            if index <= count {
            S1 = S1 + Int(String(i))!
            } else {
                S2 = S2 + Int(String(i))!
            }
             index += 1
    }
    if S1 == S2 {
        return true
    }
    return false
}
//In ra số hạnh phúc < 10000
func lietKeShp(){
    var index = 11
    while (index < 10000) {
        if (checkShp(index) == true) {
                print(index)
                index += 2
        } else {
            index += 1
        }
    }
}

lietKeShp()
