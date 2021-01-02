//
//  Mail.swift
//  Mail Client
//
//  Created by 中筋淳朗 on 2020/12/10.
//

import SwiftUI

struct Mail: Identifiable {
    
    let id = UUID()
    let senderName: String
    let sendTime: String
    let title: String
    let message: String
    
    var offsetX: CGFloat = 0
    var isRead = false
}
