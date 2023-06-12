//
//  DataSciencePrepApp.swift
//  DataSciencePrep
//
//  Created by Nick Ward on 6/6/23.
//

import SwiftUI
import CoreData

@main
struct DataSciencePrepApp: App {
    @StateObject var vm = ViewModel(api: ChatGPTAPI(apiKey: ""), initialPrompt: "What is the mean in Statistics?: ")
    @State private var isNotLoading: Bool = false
    @StateObject var vm_1 = DataSciencePrepViewModel()
    @State private var isLoading: Bool = false
    @State var isShowingTokenizer = false
    @State var showChatContent = false
    @State var llmConfig: LLMConfig?
    //@State var isShowingResultView = false // If this is a condition coming from another view, you should manage this in your ViewModel instead
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                
                Home().environmentObject(vm_1)
                    .onChange(of: vm_1.isShowingResultView) { newValue in
                        if newValue == true {
                            vm.updateTranscript(newTranscript: vm_1.transcript)
                            isLoading = true
                            Task {
                                print(isLoading)
                                await vm.fetchInitialResponse()
                                isLoading = false
                                showChatContent = true
                                vm_1.showChatContent = true
                                print("loading complete")
                                print(isLoading)
                            }
                        }
                    }
                    .fullScreenCover(isPresented: $isLoading) {
                        LoadingView()
                    }
                    .fullScreenCover(isPresented: $vm_1.showChatContent) {
                        NavigationStack {
                            ChatContentView(vm: vm)
                                .toolbar {
                                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                                        Button(action: {
                                            vm.clearMessages()
                                        }) {
                                            Text("Clear")
                                                .font(.headline)
                                                .foregroundColor(.red)
                                                .padding(.vertical, 10)
                                                .padding(.horizontal, 20)
                                                .background(Color.white.opacity(0.1))
                                                .cornerRadius(10)
                                        }
                                        .disabled(vm.isInteracting)

                                        Button(action: {
                                            vm_1.nextQuestion()
                                        }) {
                                            Text("Next Question")
                                                .font(.headline)
                                                .foregroundColor(.blue)
                                                .padding(.vertical, 10)
                                                .padding(.horizontal, 20)
                                                .background(Color.white.opacity(0.1))
                                                .cornerRadius(10)
                                        }
                                    }
                                }
                                .environmentObject(vm_1)
                        }
                    }
            }
        }
    }
    
}
