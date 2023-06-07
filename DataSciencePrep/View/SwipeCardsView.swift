//
//  SwipeCardsView.swift
//  DataSciencePrep
//
//  Created by Nick Ward on 6/6/23.
//

import SwiftUI
import SwiftSoup


struct Card: Identifiable {
    let id = UUID()
    let content: CardContent
}

struct SwipeCardsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var course: Course
    @State var currentIndex: Int = 0 // For tracking the current card
    @State var showAlert = false // For showing alert when reaching the last card
    @State var isActive = false // For navigation to TestView
    
    private func getCardOffset(_ geometry: GeometryProxy, _ index: Int) -> CGFloat {
        if currentIndex == index {
            return 0
        } else if index < currentIndex {
            return -geometry.size.width
        } else {
            return geometry.size.width
        }
    }
    
    @ViewBuilder
        var backButton : some View {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                        .aspectRatio(contentMode: .fit)
                }
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.black.opacity(0.6))
                .cornerRadius(30)
                .shadow(radius: 10)
            }
        }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Card Count
                HStack {
                                    self.backButton
                                    Spacer()
                                    Text("\(currentIndex + 1)/\(course.cardContent.count)")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                        .transition(AnyTransition.scale(scale: 0.5).combined(with: .opacity))
                                        .animation(.easeInOut(duration: 0.5))
                                        .padding(.trailing, 20)
                                    
                                }

                Spacer()
                
                ZStack {
                    ForEach(course.cardContent.indices, id: \.self) { index in
                        CardView(content: course.cardContent[index])
                            .offset(x: self.getCardOffset(geometry, index), y: 0)
                            .animation(.spring())
                            .padding(.horizontal)
                            .gesture(DragGesture()
                                .onEnded { value in
                                    if value.translation.width < -100 { // Swipe left
                                        if currentIndex == course.cardContent.count - 1 { // If it's the last card
                                            showAlert = true
                                        } else {
                                            currentIndex += 1
                                        }
                                    } else if value.translation.width > 100 { // Swipe right
                                        if currentIndex > 0 {
                                            currentIndex -= 1
                                        }
                                    }
                                }
                            )
                    }
                }
                
                Spacer()
                
                // Navigation to TestView
                NavigationLink(destination: TestView(), isActive: $isActive) {
                    EmptyView()
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)

        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Proceed to Test"), message: Text("You have reached the last card. Do you want to proceed to the test?"), primaryButton: .default(Text("Yes"), action: {
                isActive = true
            }), secondaryButton: .cancel())
        }
    }
}

struct CardView: View {
    var content: CardContent

    var body: some View {
        VStack {
            Text(content.title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.vertical)
            
            formattedDescription()
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
    
    func formattedDescription() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(content.description.split(separator: "\n"), id: \.self) { line in
                if line.hasPrefix("•") {
                    HStack {
                        Text("•")
                        processHTML(String(line.dropFirst(2)))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                } else {
                    processHTML(String(line))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }

    func processHTML(_ string: String) -> Text {
        // Split the string into an array, separating by HTML tags
        let parts = string.components(separatedBy: ["<", ">"])
        
        // Start with an empty Text
        var result = Text("")
        
        var isBold = false
        var isSmall = false

        // Iterate over each part
        for part in parts {
            switch part {
            case "bold":
                isBold = true
            case "/bold":
                isBold = false
            case "small":
                isSmall = true
            case "/small":
                isSmall = false
            default:
                let text = part
                if isBold {
                    result = result + Text(text).bold()
                } else if isSmall {
                    result = result + Text(text).font(.footnote)
                } else {
                    result = result + Text(text)
                }
            }
        }
        
        return result
    }



}

struct TestView: View {
    var body: some View {
        Text("Final Test View")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
}
