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
    @StateObject var vm = ViewModel(api: ChatGPTAPI(apiKey: "Your key here"), initialPrompt: "What is the mean in Statistics?: ")
    @State private var isNotLoading: Bool = false
    @StateObject var vm_1 = DataSciencePrepViewModel()
    @State private var isLoading: Bool = false
    @State var isShowingTokenizer = false
    @State var showChatContent = false
    @State var llmConfig: LLMConfig?
    @State var isShowingResultView = false // If this is a condition coming from another view, you should manage this in your ViewModel instead
    
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
                                print("loading complete")
                                print(isLoading)
                            }
                        }
                    }
                    .fullScreenCover(isPresented: $isLoading) {
                        LoadingView()
                    }
                    .fullScreenCover(isPresented: $showChatContent) {
                        NavigationStack {
                            ChatContentView(vm: vm)
                                .toolbar {
                                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                                        Button("Clear", role: .destructive) {
                                            vm.clearMessages()
                                        }
                                        .disabled(vm.isInteracting)
                                    }
                                }
                                .environmentObject(vm_1)
                        }
                    }
            }
        }
    }
    
}
