//
//  Thoughts.swift
//  Pop
//
//  Created by Victor Odouard on 12/24/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import Foundation

class Mind {
    var thoughts: [Thought]
    
    init(firstThought: Thought) {
       thoughts = [firstThought]
    }
    
    func nextThought() -> Thought {
            return thoughts[0]
    }
}

