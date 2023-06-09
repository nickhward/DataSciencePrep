//
//  LoadingView.swift
//  DataSciencePrep
//
//  Created by Nick Ward on 6/8/23.
//

import SwiftUI

struct LoadingView: View {
    @State private var animate = false
    @State private var isTextVisible = false
    let timing: Double = 0.6
    let delayRange = 0...8
    
    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(spacing: 20) {
                    ForEach(0..<6) { index in
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 8, height: 8)
                            .scaleEffect(animate ? 0 : 1)
                            .animation(
                                Animation
                                    .easeInOut(duration: timing)
                                    .repeatForever()
                                    .delay(Double(index) / Double(delayRange.upperBound) * timing)
                            )
                    }
                }
                .padding(.bottom, 50)
                
                Text("Processing Your Answer")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(isTextVisible ? .gray : .white)
                    .animation(Animation.easeIn(duration: 2))
            }
        }
        .onAppear {
            animate = true
            isTextVisible = true
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
