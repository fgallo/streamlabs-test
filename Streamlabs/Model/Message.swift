//
//  Message.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

struct Message {
    
    var userName: String
    var text: String
    
    init(userName: String, text: String) {
        self.userName = userName
        self.text = text
    }
    
}
