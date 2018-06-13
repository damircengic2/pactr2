//
//  Date.swift
//  Packr
//
//  Created by mini1 on 08/06/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import Foundation

extension Date {
    
 func toString(withFormat format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let myString = formatter.string(from: self)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = format
        
        return formatter.string(from: yourDate!)
    }


}

