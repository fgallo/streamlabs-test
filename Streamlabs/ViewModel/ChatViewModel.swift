//
//  ChatViewModel.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

class ChatViewModel {
    
    private var messages: [Message]
    
    init() {
        self.messages = [
            Message(userName: "drg5", text: "just liked this 100 times!"),
            Message(userName: "ninja", text: "\u{1F496} \u{1F496} \u{1F496} \u{1F496}"),
            Message(userName: "yuierooo", text: "how do you even do that? \u{1F525} \u{1F525} \u{1F525}"),
            Message(userName: "picachU", text: "im gon try that!! \u{1F63A} \u{1F63A} \u{1F63A}")
        ]
    }
    
    func  numberOfMessages() -> Int {
        return messages.count
    }
    
    func messageAt(indexPath: IndexPath) -> Message {
        return messages[indexPath.row]
    }
    
}
