//
//  File.swift
//  TriviaUITests
//
//  Created by Thu nguyen on 3/18/24.
//

import Foundation
struct JSONQuestion: Codable {
    let response_code: Int
    let results: [Question]
}

struct Question: Codable {
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}
