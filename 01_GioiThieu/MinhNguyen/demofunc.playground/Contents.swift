import UIKit

func hello (name: String)->String{
    return "hello" + name + "!"
}
hello(name: "mn ")


//su dung inout de thay doi gia tri trong func
// su dung tham chiu de gan gtri tham so
func swap(_ a:inout Int , _ b:inout Int)
{
    a = a + b
    b = a - b
    a = a - b
}
var so1 = 1
var so2 = 2
swap(&so1,&so2)



