//
//  ResultsView.swift
//  DataSciencePrep
//
//  Created by Nick Ward on 6/7/23.
//

import SwiftUI

struct ResultView: View {
    let transcript: String
    
    var body: some View {
        VStack {
            Text(transcript)
                .font(.title)
                .padding()
        }
    }
}
