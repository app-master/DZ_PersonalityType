//
//  ResultManager.swift
//  PersonalityType
//
//  Created by user on 21/03/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

struct ResultManager {
    
    static func calculateResult(for answers: [Answer]) -> PersonalType? {
        
        var optimist = 0
        var pessimist = 0
        var realist = 0
        var naughty = 0
        
        for answer in answers {
            
            switch answer.personalType {
            
            case .optimist:
                optimist += 1
            case .pessimist:
                pessimist += 1
            case .realist:
                realist += 1
            case .naughty:
                naughty += 1
            
            }
            
        }
        
        var array = [optimist, pessimist, realist, naughty]
        
        array.sort { (i, j) -> Bool in
            return i < j
        }
        
        let result = array.last
        
        switch result {
        case optimist:
            return PersonalType.optimist
        case pessimist:
            return PersonalType.pessimist
        case realist:
            return PersonalType.realist
        case naughty:
            return PersonalType.naughty
        default:
            return nil
        }
        
    }
}
