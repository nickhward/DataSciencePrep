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
    @ObservedObject var vm_1: DataSciencePrepViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var course: Course
    @State var currentIndex: Int = 0
    @State var shouldGoToTestView = false
    
    private func getCardOffset(_ geometry: GeometryProxy, _ index: Int) -> CGFloat {
        if currentIndex == index {
            return 0
        } else if index < currentIndex {
            return -geometry.size.width
        } else {
            return geometry.size.width
        }
    }
    
    @State private var swipedOnLastCard = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                NavigationBarView(currentIndex: $currentIndex, totalCards: course.cardContent.count, presentationMode: presentationMode)
                
                ZStack {
                    ForEach(course.cardContent.indices, id: \.self) { index in
                        CardView(content: course.cardContent[index])
                            .offset(x: self.getCardOffset(geometry, index), y: 0)
                            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.6))
                            .gesture(DragGesture().onEnded { value in
                                if value.translation.width < -100 {
                                    if currentIndex < course.cardContent.count - 1 {
                                        currentIndex += 1
                                    } else {
                                        swipedOnLastCard = true
                                        shouldGoToTestView = true
                                    }
                                } else if value.translation.width > 100 {
                                    if currentIndex > 0 {
                                        currentIndex -= 1
                                    }
                                }
                            })
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            .navigationBarBackButtonHidden(true)
            NavigationLink(destination: TestView(vm_1: vm_1), isActive: $shouldGoToTestView) {
                        EmptyView()
                    }
        }
    }
}

struct NavigationBarView: View {
    @Binding var currentIndex: Int
    var totalCards: Int
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            BackButtonView(action: {
                self.presentationMode.wrappedValue.dismiss()
            })
            Spacer()
            CardCounterView(current: currentIndex + 1, total: totalCards)
        }
    }
}

struct BackButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "arrow.left.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
                .padding()
                .background(Color.white)
                .cornerRadius(40)
                .shadow(radius: 3)
        }
    }
}

struct CardCounterView: View {
    var current: Int
    var total: Int
    
    var body: some View {
        Text("\(current)/\(total)")
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
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
                .foregroundColor(.white)
                .padding(.horizontal)
                .background(Color.blue.opacity(0.7))
                .cornerRadius(10)
            
            Text(.init(content.description))
            //formattedDescription()
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 10, x: 2, y: 2)
    }
    
    func formattedDescription() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(content.description.split(separator: "\n"), id: \.self) { line in
                if line.hasPrefix("•") {
                    HStack {
                        Text("•")
                        Text(String(line.dropFirst(2)))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                } else {
                    Text(String(line))
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


