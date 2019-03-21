//
//  Question.swift
//  PersonalityType
//
//  Created by user on 20/03/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

struct Question {
    
    let text: String
    let type: QuestionType
    var answers: [Answer]
    
    static func loadData() -> [Question] {
        
    return [Question(
            text: "На какой материал в газетах вы в первую очередь обращаете внимание?",
            type: .single,
            answers: [Answer(text: "На новости политики и экономики", personalType: PersonalType.pessimist),
                      Answer(text: "На спортивные новости", personalType: PersonalType.realist),
                      Answer(text: "На разделы о культуре", personalType: PersonalType.optimist),
                      Answer(text: "На статьи о светской жизни", personalType: PersonalType.naughty)]),
            Question(
                text: "Каковы ваши первые мысли с утра после пробуждения?",
                type: .multiple,
                answers: [Answer(text: "Мысли о том, что там с погодой сегодня?", personalType: PersonalType.realist),
                          Answer(text: "Какой сегодня прекрасный день!", personalType: PersonalType.naughty),
                          Answer(text: "Мысли о любимом человеке или о друзьях", personalType: PersonalType.optimist),
                          Answer(text: "Мысли о текущих проблемах", personalType: PersonalType.pessimist)]),
            Question(
                text: "Какие вы чаще всего видите сны?",
                type: .range,
                answers: [Answer(text: "Страшные, драматичные", personalType: PersonalType.pessimist),
                          Answer(text: "Tуманные, плохо запоминающиеся", personalType: PersonalType.naughty),
                          Answer(text: "Радостные, приятные", personalType: PersonalType.optimist),
                          Answer(text: "Страстные, эротичные", personalType: PersonalType.realist)])]
        
    }
    
}

enum QuestionType {
    
    case single
    case multiple
    case range
    
}
