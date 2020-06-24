import Foundation
func ptbac1(num1 a: Int, num2 b: Int) -> Any {
    if a == 0 {
        if b != 0 {
            return "vô nghiệm"
        }
        else {
        return "vô số nghiệm"
           
        }
    }
    else if b == 0{
        return 0
    }
    else {
        return Double(-b/a)
    }
    
}
func ptbac2(num1 a: Int, num2 b: Int, num3 c: Int) -> (Any,Double?) {
    
    if a == 0 {
        return (ptbac1(num1: b, num2: c), nil)
    } else if b == 0 && c == 0 {
        return (0,nil)
        
    } else if b == 0 && c != 0 {
        let x = -c/a
        return ((sqrt(Double(x))),-(sqrt(Double(x))))
    }
    else {
        let delta = pow(Double(b), 2) - 4*Double(a*c)
      switch delta {
      case ...0:
        return ("vô nghiệm",nil)
        // phương trình vô nghiệm
      case 0 :
        return (-Double(b)/Double((2*a)),-Double(b)/Double((2*a)))
      default:
        let x1 = (  -Double(b) + sqrt(delta)) / Double(2*a)
        let x2 = (-Double(b) - sqrt(delta)) / Double(2*a)
       return (x1,x2)
      }
    
    }
}

let kq = ptbac2(num1: 0, num2: 0, num3: 0)
let x1 = kq.0
if let x2 = kq.1 {
    print("nghiệm của phương trình là: \(x1), \(x2)")
}
else {
    print("nghiệm của phương trình là: \(x1)")
}
      
       
    

