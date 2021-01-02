//
//  TopLeftShape.swift
//  Mail Client
//
//  Created by 中筋淳朗 on 2020/12/10.
//

import SwiftUI

struct TopLeftShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let point1 = CGPoint(x: 0, y: height * 0.8)
        let point2 = CGPoint(x: width * 0.6, y: height * 0.55)
        let point3 = CGPoint(x: width, y: height * 0.2)
        
        // MARK: - Path
        var path = Path()
        
        path.move(to: point1)
        
        path.addCurve(to: point2, control1: CGPoint(x: width * 0.25, y: height * 0.9), control2: CGPoint(x: width * 0.5, y: height * 0.75))
        path.addCurve(to: point3, control1: CGPoint(x: width * 0.69, y: height * 0.35), control2: CGPoint(x: width * 0.8, y: height * 0.25))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        
        return path
    }
}

