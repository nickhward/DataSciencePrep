//
//  DetailView.swift
//  DataSciencePrep
//
//  Created by Nick Ward on 6/6/23.
//
import SwiftUI

struct DetailView: View {
    @ObservedObject var vm_1: DataSciencePrepViewModel
    @Binding var show: Bool
    var animation: Namespace.ID
    var course: Course
    /// View Properties
    @State private var animateContent: Bool = false
    @State private var offsetAnimation: Bool = false
    var body: some View {
        VStack(spacing: 15) {
            /// Close Button
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    offsetAnimation = false
                }
                
                /// Closing Detail View
                withAnimation(.easeInOut(duration: 0.35).delay(0.1)) {
                    animateContent = false
                    show = false
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .contentShape(Rectangle())
            }
            .padding([.leading, .vertical], 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .opacity(animateContent ? 1 : 0)
            
            /// Book Preview (With Matched Geometry Effect)
            GeometryReader {
                let size = $0.size
                
                HStack(spacing: 20) {
                    Image(course.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: (size.width - 30) / 2, height: size.height)
                        /// Custom Corner Shape
                        .clipShape(CustomCorners(corners: [.topRight, .bottomRight], radius: 20))
                        /// Matched Geometry ID
                        .matchedGeometryEffect(id: course.id, in: animation)
                    
                    /// Book Details
                    VStack(alignment: .leading, spacing: 8) {
                        Text(course.title)
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("By \(course.author)")
                            .font(.callout)
                            .foregroundColor(.gray)
                        
                        RatingView(rating: course.rating)
                    }
                    .padding(.trailing, 15)
                    .padding(.top, 30)
                    .offset(y: offsetAnimation ? 0 : 100)
                    .opacity(offsetAnimation ? 1 : 0)
                }
            }
            .frame(height: 220)
            /// Placing it Above
            .zIndex(1)
            
            Rectangle()
                .fill(.gray.opacity(0.04))
                .ignoresSafeArea()
                .overlay(alignment: .top, content: {
                    BookDetails()
                })
                .padding(.leading, 30)
                .padding(.top, -180)
                .zIndex(0)
                .opacity(animateContent ? 1 : 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background {
            Rectangle()
                .fill(.white)
                .ignoresSafeArea()
                .opacity(animateContent ? 1 : 0)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.35)) {
                animateContent = true
            }
            
            withAnimation(.easeInOut(duration: 0.35).delay(0.1)) {
                offsetAnimation = true
            }
        }
    }
    
    @ViewBuilder
    func BookDetails() -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    
                } label: {
                    Label("Reviews", systemImage: "text.alignleft")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)

                Button {
                    
                } label: {
                    Label("Like", systemImage: "suit.heart")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                Button {
                    
                } label: {
                    Label("Share", systemImage: "square.and.arrow.up")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
            }
            
            Divider()
                .padding(.top, 25)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    Text("About the course")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    /// couse description
                    Text(course.courseDescription)
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 15)
                .padding(.top, 20)
            }
            
            Button(action: {}) {
                NavigationLink(destination: SwipeCardsView(vm_1: vm_1, course: course)) {
                    Text("Start")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 45)
                        .padding(.vertical, 10)
                        .background {
                            Capsule().fill(Color("Blue").gradient)
                        }
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 15)
        }
        .padding(.top, 180)
        .padding([.horizontal, .top], 15)
        /// Applying Offset Animation
        .offset(y: offsetAnimation ? 0 : 100)
        .opacity(offsetAnimation ? 1 : 0)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/// Dummy Text
let dummyText: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages."
