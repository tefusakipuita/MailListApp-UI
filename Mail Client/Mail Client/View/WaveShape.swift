//
//  WaveShape.swift
//  Mail Client
//
//  Created by 中筋淳朗 on 2020/12/10.
//

import SwiftUI

struct WaveShape: Shape {
    
    // MARK: - Property
    
    // ドラッグ量
    var waveWidth: CGFloat
    
    // ドラッグ分から 10 だけズラす
    let paddingValue: CGFloat = 10
    
    // ドラッグが 240 を超えて 0 に戻る時なめらかにアニメーションして戻るようになる
    var animatableData: CGFloat {
        get { waveWidth }
        set { waveWidth = newValue }
    }
    
    
    // MARK: - Function
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        
        // MARK: - Path
        var path = Path()
        
        // 右スワイプの場合 (既読)
        if waveWidth > paddingValue {
            let point1 = CGPoint(x: waveWidth - paddingValue, y: height / 2)
            let point2 = CGPoint(x: 0, y: height)
            
            let cPoint1 = CGPoint(x: 0, y: 30)
            let cPoint2 = CGPoint(x: waveWidth - paddingValue, y: 20)
            
            let cPoint3 = CGPoint(x: waveWidth - paddingValue, y: height - 20)
            let cPoint4 = CGPoint(x: 0, y: height - 30)
            
            path.move(to: CGPoint(x: 0, y: 0))
            
            path.addCurve(to: point1, control1: cPoint1, control2: cPoint2)
            path.addCurve(to: point2, control1: cPoint3, control2: cPoint4)
            path.closeSubpath()
        }
        
        // 左スワイプの場合 (削除)
        if waveWidth < -paddingValue {
            let point1 = CGPoint(x: width + waveWidth + paddingValue, y: height / 2)
            let point2 = CGPoint(x: width, y: height)
            
            let cPoint1 = CGPoint(x: width, y: 30)
            let cPoint2 = CGPoint(x: width + waveWidth + paddingValue, y: 20)
            
            let cPoint3 = CGPoint(x: width + waveWidth + paddingValue, y: height - 20)
            let cPoint4 = CGPoint(x: width, y: height - 30)
            
            path.move(to: CGPoint(x: width, y: 0))
            
            path.addCurve(to: point1, control1: cPoint1, control2: cPoint2)
            path.addCurve(to: point2, control1: cPoint3, control2: cPoint4)
            path.closeSubpath()
        }
        
        
        return path
    }
}
