//
//  ContentView.swift
//  Mail Client
//
//  Created by 中筋淳朗 on 2020/12/10.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager = MailManager()
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            BackgroundView()
                .edgesIgnoringSafeArea(.all)
                
            // MARK: - Mail List
            ScrollView {
                VStack {
                    ForEach(manager.mailData) { mail in
                        ZStack (alignment: .leading) {
                            // MARK: - Wave Button
                            ReadSwipeButton(manager: manager, mail: mail)
                            
                            // MARK: - Mail Item
                            MailItemView(mail: mail)
                                .frame(width: UIScreen.screenWidth)
                                // タップ
                                .onTapGesture {
                                    withAnimation {
                                        manager.deletePinkMarker(mail: mail)
                                        manager.selectedMail = mail
                                    }
                                }
                                // ドラッグ
                                .gesture(
                                    DragGesture(minimumDistance: 5)
                                        .onChanged({ value in
                                            swipeRight(value: value, mail: mail)
                                        })
                                        .onEnded({ value in
                                            onEnded(value: value)
                                        })
                                ) //: gesture
                        } //: ZStack
                    } //: ForEach
                } //: VStack
            } //: Scroll
            
            // MARK: - Detail
            if manager.selectedMail != nil {
                MailDetailView(mail: manager.selectedMail!, manager: manager)
            }
            
        } //: ZStack
    }
    
    
    // MARK: - Function
    func swipeRight(value: DragGesture.Value, mail: Mail) {
        let moveX = value.translation.width
        
        // 既読用
        if moveX > 0 {
            if !mail.isRead {  // すでに既読の場合は、スワイプはさせない
                manager.readGesture(mail: mail, swipeWidth: moveX)
            }
        }
        // 削除用
        else if moveX < 0 {
            manager.deleteGesture(mail: mail, swipeWidth: moveX)
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        manager.swipeEnded()
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
