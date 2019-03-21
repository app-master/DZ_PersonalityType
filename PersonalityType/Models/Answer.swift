//
//  Answer.swift
//  PersonalityType
//
//  Created by user on 20/03/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

struct Answer {
    
    let text: String
    let personalType: PersonalType
    
}

enum PersonalType: Character {
    
    case optimist = "😀"
    case pessimist = "🙁"
    case realist = "😐"
    case naughty = "🤪"
    
    var description: String {
        
        switch self {
        case .optimist:
            return "Все хорошо, а будет еще лучше!"
        case .pessimist:
            return "У вас довольно трезвый взгляд на мир, но и пессимистических ноток вы не лишены, и время от времени они проявляются, обычно в плохом настроении. Чаще радуйте себя, потому что жизнь - вовсе не такая плохая штука, как кажется и как показывают по телевизору"
        case .realist:
            return "Вы адекватно и правильно воспринимаете окружающие события и в любой ситуации сохраняете оптимизм и здравый ум, не поддаваясь настроению. Вы не склонны философствовать и предаваться эмоциям - вы действуете!"
        case .naughty:
            return "Будь что будет!"
        }
        
    }
    
}
