class Mang1C {
    
    var arr: [Int]
    
    init(arr: [Int]) {
        self.arr = arr
    }
    
    func inMang(){
        print ("\(arr)")
    }
    
    func maxArr()-> Int{
        var max = arr[0]
        for i in 1...arr.count - 1{
            if arr[i] > max{
                max = arr[i]
            }
        }
        return max
    }
    
    func minArr() -> Int {
           var min = arr[0]
           for i in 1...arr.count - 1{
               if arr[i] < min{
                   min = arr[i]
               }
           }
           return min
       }
}

var arr1 = Mang1C(arr: [4,6,8,2,6,3])
arr1.inMang()
arr1.minArr()
arr1.maxArr()
