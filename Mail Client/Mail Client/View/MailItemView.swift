//
//  MailItemView.swift
//  Mail Client
//
//  Created by 中筋淳朗 on 2020/12/10.
//

import SwiftUI

struct MailItemView: View {
    
    // MARK: - Property
    
    let mail: Mail
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.itemBg.opacity(0.75))
                .frame(width: CGFloat.mailWidth, height: CGFloat.mailHeight)
             
            // MARK: - メール内容
            HStack (alignment: .top) {
                VStack (alignment: .leading, spacing: 4) {
                    Text(mail.senderName)
                        .foregroundColor(Color.white.opacity(0.7))
                        .font(.system(size: 14))
                    
                    Text(mail.title)
                        .font(.system(size: 20, weight: .semibold))
                        .background(
                            Color.white.opacity(0.7)
                                .frame(height: 1)
                                .offset(y: 14)
                        )
                    
                    Text(mail.message)
                        .foregroundColor(Color.white.opacity(0.7))
                        .lineLimit(2)
                        .padding(.top, 10)
                } //: VStack
                
                Text(mail.sendTime)
                    
            } //: HStack
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .frame(width: CGFloat.mailWidth, height: CGFloat.mailHeight)
            
            // MARK: - 未読サークル
            Circle()
                .fill(Color.pinkGradient)
                .opacity(mail.isRead ? 0 : 1)
                .frame(width: 15, height: 15)
                .offset(x: -CGFloat.mailWidth / 2 + 2, y: -CGFloat.mailHeight / 2 + 3)
        } //: ZStack
        .offset(x: mail.offsetX)
    }
}

// MARK: - Preview

struct MailItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


