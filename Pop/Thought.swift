//
//  Thought.swift
//  Pop
//
//  Created by Victor Odouard on 12/24/16.
//  Copyright © 2016 VoDev. All rights reserved.
//

import Foundation
import UIKit

class Thought {
    var title: String
    var image: UIImage?
    var body: String?
    var location: String?
    var time: String?
    var frequency: Int
    var dateLastSeen: String
    
    init(title t: String, image i: UIImage?, body b: String?, location l: String?, time ti: String?, frequency f: Int = 100) {
        title = t
        if let img = i { image = img }
        if let bdy = b { body = bdy }
        if let lcn = l { location = lcn }
        if let tme = ti { time = tme }
        frequency = f
        dateLastSeen = "now"
    }
    
}
