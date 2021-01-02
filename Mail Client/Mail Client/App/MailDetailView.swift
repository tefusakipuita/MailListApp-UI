//
//  MailDetailView.swift
//  Mail Client
//
//  Created by 中筋淳朗 on 2020/12/10.
//

import SwiftUI

struct MailDetailView: View {
    
    // MARK: - Property
    
    let mail: Mail
    
    @ObservedObject var manager: MailManager
    
    @State var appearAnimation = false
    @State var dismissAnimation = false
    
    var bgAnimation = Animation.spring(response: 0.45, dampingFraction: 0.65)
    var textAnimation = Animation.spring(response: 0.35, dampingFraction: 0.65)
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            
            // MARK: - Background
            BackgroundView()
                .rotationEffect(Angle(degrees: 180))
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                
                // MARK: - Rounded Rectangle
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.itemBg.opacity(0.75))
                    .frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenHeight - 100)
                    .offset(x: !appearAnimation ? UIScreen.screenWidth : dismissAnimation ? -UIScreen.screenWidth : 0)
                    .animation(bgAnimation.delay(0.3))
                     
                // MARK: - Text
                VStack (alignment: .leading) {
                    Text(mail.senderName)
                        .font(.system(size: 14))
                        .padding(.bottom, 2)
                        .offset(x: !appearAnimation ? UIScreen.screenWidth : dismissAnimation ? -UIScreen.screenWidth : 0)
                        .animation(textAnimation.delay(0.85))
                    
                    Text(mail.title)
                        .font(.system(size: 20, weight: .semibold))
                        .offset(x: !appearAnimation ? UIScreen.screenWidth : dismissAnimation ? -UIScreen.screenWidth : 0)
                        .animation(textAnimation.delay(0.98))
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: UIScreen.screenWidth - 100, height: 1)
                        .offset(x: !appearAnimation ? UIScreen.screenWidth : dismissAnimation ? -UIScreen.screenWidth : 0)
                        .animation(textAnimation.delay(1.11))
                    
                    Text(mail.message)
                        .padding(.top, 20)
                        .offset(x: !appearAnimation ? UIScreen.screenWidth : dismissAnimation ? -UIScreen.screenWidth : 0)
                        .animation(textAnimation.delay(1.24))
                    
                    Spacer()
                    
                    // MARK: - Back Button
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            dismissDetail()
                        }, label: {
                            ZStack {
                                Capsule()
                                    .fill(Color.pinkGradient)
                                    .frame(width: 130, height: 60)
                                
                                Text("Back")
                                    .font(.system(size: 24, weight: .semibold))
                                    .kerning(2)
                            } //: ZStack
                        })
                        .offset(x: !appearAnimation ? UIScreen.screenWidth : dismissAnimation ? -UIScreen.screenWidth : 0)
                        .animation(textAnimation.delay(1.47))
                        
                        Spacer()
                    } //: HStack
                    .padding(.bottom, 40)
                } //: VStack
                .foregroundColor(.white)
                .padding(.horizontal, 18)
                .padding(.top, 38)
                .frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenHeight - 100)
                
            } //: ZStack
            
        } //: ZStack
        .opacity(dismissAnimation ? 0 : 1)
        .animation(Animation.easeOut(duration: 0.7).delay(1.55))
        .onAppear(perform: {
            withAnimation {
                appearAnimation = true
            }
        })
    }
    
    
    // MARK: - Function
    
    func dismissDetail() {
        withAnimation {
            // dismiss animation
            dismissAnimation = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.25) {
            manager.selectedMail = nil
        }
    }
}

// MARK: - Preview

struct MailDetailView_Previews: PreviewProvider {
    static let mail = Data.mailData[0]
    @ObservedObject static var manager = MailManager()
    
    static var previews: some View {
        MailDetailView(mail: mail, manager: manager)
    }
}
