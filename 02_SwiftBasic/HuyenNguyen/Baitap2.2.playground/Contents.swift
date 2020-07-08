import UIKit

func quadraticEquation( a: Float, b: Float, c: Float) -> Float {
    let delta : Float = b * b - (4 * a * c)
    if delta == 0 { print("x =", -b / (2 * a)) }
    else if delta < 0 { print("no solution") }
    else { print("x1 =", -b + sqrtf(delta) / (2 * a), "x2 = ", -b - sqrtf(delta) / (2 * a)) }
    return delta
}

print(quadraticEquation(a: 1, b: 3, c:1) )
