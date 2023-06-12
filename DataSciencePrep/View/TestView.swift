import SwiftUI



struct TestView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var vm_1: DataSciencePrepViewModel
    @StateObject private var viewModel = TestViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color(.systemGray6)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    BackButtonTestView(action: { presentationMode.wrappedValue.dismiss() })
                    Spacer()
                }
                .padding(.top)
                
                Text(vm_1.currentQuestion)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding([.horizontal, .bottom])
                
                Spacer()
                
                RecordButtonView(isRecording: $viewModel.isRecording, action: viewModel.recordButtonTapped)
                
                if viewModel.isRecording {
                    Text("Recording...")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .transition(.opacity)
                        .padding(.top)
                }
                
                SubmitButtonView(isRecording: $viewModel.isRecording, transcript: $viewModel.transcript, action: {
                    viewModel.submitRecording()
                    vm_1.transcript = viewModel.transcript
                    vm_1.isShowingResultView = true
                    viewModel.deleteRecording()
                })
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct RecordButtonView: View {
    @Binding var isRecording: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: isRecording ? "stop.fill" : "mic.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(isRecording ? .red : .primary)
                .padding()
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SubmitButtonView: View {
    @Binding var isRecording: Bool
    @Binding var transcript: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Submit")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isRecording || transcript.isEmpty ? Color.gray : Color.blue)
                .cornerRadius(15)
                .padding(.top)
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(isRecording || transcript.isEmpty)
    }
}

struct BackButtonTestView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "arrow.left")
                .resizable()
                .scaledToFit()
                .frame(width: 25)
                .foregroundColor(.primary)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
