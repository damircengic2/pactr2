//
//  Storage.swift
//  Packr
//
//  Created by Mini8 on 17/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import Foundation

class Storage {
    static let shared: Storage = Storage()
    
    var objects : [Pact]
    var users : [String]
    
    private init() {
        objects = [Pact]()
        users = [String]()
    }
    
    
    
}
