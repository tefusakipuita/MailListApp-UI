//
//  BackgroundView.swift
//  Mail Client
//
//  Created by 中筋淳朗 on 2020/12/10.
//

import SwiftUI

struct BackgroundView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack {
            
            // MARK: - Background
            Color.bgBlack
            
            // MARK: - Top Left Shape
            TopLeftShape()
                .fill(Color.greenGradient)
                .frame(width: UIScreen.screenWidth, height: 300)
                .offset(y: -320)
            
            // MARK: - Bottom Right Shape
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.orangeGradient)
                .frame(width: CGFloat.bottomShapeSize, height: CGFloat.bottomShapeSize)
                .rotationEffect(Angle(degrees: -45))
                .offset(x: UIScreen.screenWidth * 0.3 , y: UIScreen.screenHeight * 0.43)
        } //: ZStack
    }
}

// MARK: - Preview

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
