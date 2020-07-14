import UIKit

//Find Fibonacci
func calFibonacci(n: Int) -> Int {
  if n <= 2 {
    return 1
  }
    return calFibonacci(n: n - 1) + calFibonacci(n: n - 2)
}

//Calculate Sum Fibonacci
func sumFibonacci(n: Int) -> Int {
  var sum = 0
    for i in 1...n {
    sum += calFibonacci(n: i)
  }
  return sum
}

//List Fibonacci
func printListFibo(n: Int){
    for i in 1...n {
        let fi = calFibonacci(n: i);
        print(fi)
    }
}

print(sumFibonacci(n: 3))
printListFibo(n: 3)

//check happy number
func isHappyNumber(_ number: Int) -> (Bool) {
    var num = number
    var length = 0
    var previous = 0
    var next = 0
    var preLength = 0
    var nextLength = 0
    while  num != 0 {
        length += 1
        num /= 10
    }
    if (length % 2) == 0 {
        previous = number / Int((pow(10, (Double(length) / 2))))
        next = number % Int((pow(10, (Double(length) / 2))))
        while previous != 0 {
            preLength += previous % 10
            previous /= 10
        }
        while next != 0 {
            nextLength += next % 10
            next /= 10
        }
        return preLength == nextLength
    } else {
        return false
    }
}

//list happy number
func listHappyNumber(_ n: Int) -> [Int] {
    var arr: [Int] = []
    for i in 1...n {
        if isHappyNumber(i) == true {
            arr.append(i)
        }
    }
    return arr
}

print(listHappyNumber(1000))
