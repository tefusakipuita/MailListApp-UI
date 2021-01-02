//
//  SwipeButtonView.swift
//  Mail Client
//
//  Created by 中筋淳朗 on 2020/12/10.
//

import SwiftUI

struct ReadSwipeButton: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: MailManager
    
    let mail: Mail
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            HStack {
                // MARK: - Read Wave Button
                Button(action: {
                    manager.deletePinkMarker(mail: mail)
                }, label: {
                    ZStack {
                        // ※ offsetX が０の時は clear になるように
                        WaveShape(waveWidth: mail.offsetX)
                            .fill(mail.offsetX > 0 ? Color.readGreen : Color.clear)
                            .frame(width: 60)
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                            .opacity(Double((mail.offsetX - 50) / 10))
                    } //: ZStack
                }) //: Button
                
                Spacer()
                
                // MARK: - Delete Wave Button
                Button(action: {
                    manager.deleteMail(mail: mail)
                }, label: {
                    ZStack {
                        WaveShape(waveWidth: mail.offsetX)
                            // ※ offsetX が０の時は clear になるように
                            .fill(mail.offsetX >= 0 ? Color.clear : Color.deleteRed)
                            .frame(width: 60)
                        
                        Image(systemName: "multiply")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                            .opacity(Double(-(mail.offsetX + 50) / 10))
                    } //: ZStack
                }) //: Button
            } //: HStack
        } //: ZStack
//        .offset(x: 10)
        .padding(.horizontal, 10)
        .animation(.spring())
    }
}

// MARK: - Preview

struct SwipeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
