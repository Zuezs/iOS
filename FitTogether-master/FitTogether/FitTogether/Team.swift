//
//  Team.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/11/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import Foundation

class Team {
    var name: String?
    var steps: Int?
    
    init(name: String, steps: Int) {
        self.name = name
        self.steps = steps
    }
}