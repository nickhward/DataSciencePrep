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
    @Published var currentQuestion = ""
    
}
