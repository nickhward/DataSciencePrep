//
//  DataViewModel.swift
//  DataSciencePrep
//
//  Created by Nick Ward on 6/7/23.
//

import SwiftUI

class DataSciencePrepViewModel: ObservableObject {
    @Published var isShowingResultView = false
    @Published var transcript = ""
    @Published var course: Course? // This should be set when transitioning from SwipeCardsView
    @Published var currentQuestionIndex: Int = 0
    @Published var showChatContent = false
        
    var currentQuestion: String {
        guard let course = course else { return "" }
        return course.questions[currentQuestionIndex]
    }

    func nextQuestion() {
        guard let course = course else { return }
        if currentQuestionIndex < course.questions.count - 1 {
            currentQuestionIndex += 1
            showChatContent = false
            
        }
    }
    
}
