//
//  Message.swift
//  IOSPOC
//
//  Created by Tiago Almeida on 13/09/2018.
//  Copyright © 2018 Tiago Almeida. All rights reserved.
//

import Foundation

class Message {
    
    public var id: Int?
    public var content: String?
    
    init(id: Int?, content: String?) {
        self.id = id
        self.content = content
    }
}
