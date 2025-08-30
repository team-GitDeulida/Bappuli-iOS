//
//  Bappuli.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import Foundation

struct Bappuli {
    enum State: String {
        case working
        case sleepping
    }
    
    // TODO: - 
    enum Outfit: String {
        case none
        case pajamas
    }
    
    var state: State = .sleepping
    
    var gifName: String {
        return state.rawValue
    }
}
