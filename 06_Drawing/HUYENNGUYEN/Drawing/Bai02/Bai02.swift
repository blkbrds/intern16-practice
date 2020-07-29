//  Bai02.swift
//  Drawing

import UIKit

struct Pie {
    let value: CGFloat
    let color: UIColor
    let radius: CGFloat
}

final class Bai02: UIView {
    
    //MARK: - Properties
    private var pies: [Pie] = [Pie(value: 60, color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), radius: 100),
                       Pie(value: 90, color: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), radius: 100),
                       Pie(value: 90, color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), radius: 100),
                       Pie(value: 120, color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), radius: 100)] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private var maskColor: UIColor = .black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private var sum: CGFloat {
        return pies.reduce(0) { $0 + $1.value }
    }
    
    private var boundCenter: CGPoint {
        return CGPoint(x: frame.width / 2, y: frame.height / 2)
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Function
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let whitePath = UIBezierPath(arcCenter: center, radius: 30, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        UIColor.white.setFill()
        whitePath.fill()
        drawPie()
    }
    
    private func pieOfChart(radius: CGFloat, color: UIColor, startAngle: CGFloat, endAngle: CGFloat) {
        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        color.setFill()
        path.close()
        path.fill()
    }
    
    private func drawPie() {
        var starAngle: CGFloat = 0
        var endAngle: CGFloat = 0
        for pie in pies {
            starAngle = endAngle
            endAngle += pie.value * 2 * .pi / sum
            pieOfChart(radius: pie.radius, color: pie.color, startAngle: starAngle, endAngle: endAngle)
        }
    }
}
