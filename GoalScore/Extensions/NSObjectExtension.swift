//
//  NSObjectExtension.swift
//  GoalScore
//
//  Created by mac_user on 6/28/20.
//  Copyright © 2020 com.TGL.GoalScore. All rights reserved.
//

import Foundation

extension NSObject {
    static var typeName: String {
        return String(describing: self)
    }
    
    var typeName: String {
        let thisType = type(of: self)
        return String(describing: thisType)
    }
}
