//
//  MailManager.swift
//  Mail Client
//
//  Created by 中筋淳朗 on 2020/12/10.
//

import SwiftUI

class MailManager: ObservableObject {
    
    // MARK: - Property
    
    @Published var mailData = Data.mailData
    
    @Published var selectedMail: Mail? = nil
    
    // ドラッグしているメールのインデックス番号
    var changingMailIndex = -1
    var isChanging = false
    
    
    // MARK: - Function
    
    // 未読のピンクマーカーを消す
    func deletePinkMarker(mail: Mail) {
        // 該当するインデックス番号を取得して、mailDataから該当するプロパティの値を変更する
        if let index = mailData.firstIndex(where: { $0.id == mail.id }) {
            withAnimation {
                // メールを既読に
                mailData[index].isRead = true
                // offset を元に戻す
                mailData[index].offsetX = 0
            }
        }
    }
    
    // メールの削除
    func deleteMail(mail: Mail) {
        if let index = mailData.firstIndex(where: { $0.id == mail.id }) {
            if index == changingMailIndex {
                changingMailIndex = -1
            }
            
            withAnimation {
                mailData.remove(at: index)
            }
        }
    }
    
    // 既読用Gesture
    func readGesture(mail: Mail, swipeWidth: CGFloat) {
        if swipeWidth != 0 {
            if let index = mailData.firstIndex(where: { $0.id == mail.id }) {
                swipeStarted(index: index)
                
                // swipeWidth が120以下ならその半分の値だけ offsetX を変更する
                if swipeWidth <= 120 {
                    mailData[index].offsetX = swipeWidth / 2
                }
                
                // swipeWidth が120を超えたら offsetX を120で止める
                if swipeWidth > 120 {
                    mailData[index].offsetX = 60
                }
                
                // swipeWidth が240を超えたらマーカーを消して既読判定にする
                if swipeWidth > 240 {
                    deletePinkMarker(mail: mail)
                }
            }
        }
    }
    
    // 消す用Gesture
    func deleteGesture(mail: Mail, swipeWidth: CGFloat) {
        if swipeWidth != 0 {
            if let index = mailData.firstIndex(where: { $0.id == mail.id }) {
                swipeStarted(index: index)
                
                if swipeWidth >= -120 {
                    mailData[index].offsetX = swipeWidth / 2
                }
                
                if swipeWidth < -120 {
                    mailData[index].offsetX = -60
                }
                
                if swipeWidth < -240 {
                    deleteMail(mail: mail)
                }
            }
        }
    }
    
    // ドラッグに合わせて動かす
    func swipeStarted(index: Int) {
        if (changingMailIndex != -1 && !isChanging) {
            // 前にドラッグしてそのまま放置していたメールがあれば、元に戻す
            withAnimation {
                mailData[changingMailIndex].offsetX = 0
            }
            isChanging = true
        }
        
        // changingMailIndex を更新
        changingMailIndex = index
    }
    
    // ドラッグが終わった時
    func swipeEnded() {
        isChanging = false
        
        let readStart: CGFloat = 55
        let readEnd: CGFloat = 60
        let markReadRange = readStart...readEnd
        
        let deleteStart: CGFloat = -55
        let deleteEnd: CGFloat = -60
        let markDeleteRange = deleteEnd...deleteStart
        
        if (changingMailIndex != -1) {
            // もし offsetX が 55~60 の間にないなら(あんまりドラッグしていない場合)、offsetX を０に戻す
            if !markReadRange.contains(mailData[changingMailIndex].offsetX) && !markDeleteRange.contains(mailData[changingMailIndex].offsetX) {
                withAnimation {
                    mailData[changingMailIndex].offsetX = 0
                }
            }
        }
    }
}
