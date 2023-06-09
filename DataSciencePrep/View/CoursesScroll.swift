//
//  CoursesScroll.swift
//  DataSciencePrep
//
//  Created by Nick Ward on 6/6/23.
//

import SwiftUI

struct Home: View {
    /// View Properties
    @EnvironmentObject var vm_1: DataSciencePrepViewModel
    @State private var activeTag: String = "Statistics"
    @State private var carouselMode: Bool = false
    /// For Matched Geometry Effect
    @Namespace private var animation
    /// Detail View Properties
    @State private var showDetailView: Bool = false
    @State private var selectedCourse: Course?
    @State private var animateCurrentCourse: Bool = false
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("Browse")
                    .font(.largeTitle.bold())
                
                Text("Recommended")
                    .fontWeight(.semibold)
                    .padding(.leading, 10)
                    .foregroundColor(.gray)
                    .offset(y: 2)
                
                Spacer(minLength: 10)
                
                Menu {
                    Button("Toggle Carousel Mode (\(carouselMode ? "On" : "Off"))") {
                        carouselMode.toggle()
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.init(degrees: -90))
                        .foregroundColor(.gray)
                        .frame(width: 40, height: 40)
                        .contentShape(Rectangle())
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .top], 15)
            
            TagsView()
            
            GeometryReader {
                let size = $0.size
                
                ScrollView(.vertical, showsIndicators: false) {
                    /// Books Card View
                    VStack(spacing: 35) {
                        ForEach(courses[activeTag] ?? []) { course in
                            CourseCardView(course)
                                /// Opening Detail View, When Ever Card is Tapped
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        animateCurrentCourse = true
                                        selectedCourse = course
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                            showDetailView = true
                                        }
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 20)
                    .padding(.bottom, bottomPadding(size))
                    .background {
                        ScrollViewDetector(carouselMode: $carouselMode, totalCardCount: courses[activeTag]?.count ?? 0)
                    }
                }
                /// Since we need offset from here and not from global View
                .coordinateSpace(name: "SCROLLVIEW")
            }
            .padding(.top, 15)
        }
        .overlay {
            if let selectedCourse, showDetailView {
                DetailView(vm_1: vm_1, show: $showDetailView, animation: animation, course: selectedCourse)
                /// For More Fluent Animation Transition
                    .transition(.asymmetric(insertion: .identity, removal: .offset(y: 5)))
            }
        }
        .onChange(of: showDetailView) { newValue in
            if !newValue {
                /// Resetting Book Animation
                withAnimation(.easeInOut(duration: 0.15).delay(0.4)) {
                    animateCurrentCourse = false
                }
            }
        }
    }
    
    /// Bottom Padding for last card to move up to the top
    func bottomPadding(_ size: CGSize = .zero) -> CGFloat {
        let cardHeight: CGFloat = 220
        let scrollViewHeight: CGFloat = size.height
        
        return scrollViewHeight - cardHeight - 40
    }
    
    /// Book Card View
    @ViewBuilder
    func CourseCardView(_ course: Course) -> some View {
        GeometryReader {
            let size = $0.size
            let rect = $0.frame(in: .named("SCROLLVIEW"))
            
            HStack(spacing: -25) {
                /// Book Detail Card
                /// Placing this card above the cover image
                VStack(alignment: .leading, spacing: 6) {
                    Text(course.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("By \(course.author)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    /// Rating View
                    RatingView(rating: course.rating)
                        .padding(.top, 10)
                    
                    Spacer(minLength: 10)
                    
                    HStack(spacing: 4) {
                        Text("\(course.bookViews)")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                        Text("Views")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Spacer(minLength: 0)
                        
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(20)
                .frame(width: size.width / 2, height: size.height * 0.8)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        /// Applying Shadow
                        .shadow(color: .black.opacity(0.08), radius: 8, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.08), radius: 8, x: -5, y: -5)
                }
                .zIndex(1)
                /// Moving the book, it it's tapped
                .offset(x: animateCurrentCourse && selectedCourse?.id == course.id ? -20 : 0)
                
                /// Book Cover Image
                ZStack {
                    if !(showDetailView && selectedCourse?.id == course.id) {
                        Image(course.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width / 2, height: size.height)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            /// Matched Geometry ID
                            .matchedGeometryEffect(id: course.id, in: animation)
                            /// Applying Shadow
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: size.width)
            .rotation3DEffect(.init(degrees: convertOffsetToRotation(rect)), axis: (x: 1, y: 0, z: 0), anchor: .bottom, anchorZ: 1, perspective: 0.8)
        }
        .frame(height: 220)
    }
    
    /// Converting MinY to Rotation
    func convertOffsetToRotation(_ rect: CGRect) -> CGFloat {
        let cardHeight = rect.height + 20
        let minY = rect.minY - 20
        let progress = minY < 0 ? (minY / cardHeight) : 0
        let constrainedProgress = min(-progress, 1.0)
        return constrainedProgress * 90
    }
    
    /// Tags View
    @ViewBuilder
    func TagsView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.caption)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background {
                            if activeTag == tag {
                                Capsule()
                                    .fill(Color("Blue"))
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            } else {
                                Capsule()
                                    .fill(.gray.opacity(0.2))
                            }
                        }
                        .foregroundColor(activeTag == tag ? .white : .gray)
                        /// Changing Active Tag when tapped one of the tag
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
                                activeTag = tag
                            }
                        }
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

/// Sample Tags
var tags: [String] = [
    "Statistics", "Probability", "Machine Learning", "Deep Learning", "SQL", "Python"
]

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

