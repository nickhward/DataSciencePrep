//
//  TestViewModel.swift
//  DataSciencePrep
//
//  Created by Nick Ward on 6/7/23.
//
import AVFoundation
import Speech

class TestViewModel: ObservableObject {
    @Published var isRecording = false
    @Published var transcript = ""
    
    private let audioEngine = AVAudioEngine()
    private let speechRecognizer = SFSpeechRecognizer()
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    init() {
        requestPermissions()
    }
    
    
    func recordButtonTapped() {
        if isRecording {
            stopRecording()
        } else {
            startRecording()
        }
    }
    
    private func startRecording() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Failed to set up audio session: \(error)")
            return
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { return }
        
        let inputNode = audioEngine.inputNode
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { [weak self] result, error in
            if let result = result {
                DispatchQueue.main.async {
                    self?.transcript = result.bestTranscription.formattedString
                }
            } else if let error = error {
                print("Speech recognition failed: \(error)")
                self?.stopRecording()
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            recognitionRequest.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
            isRecording = true
        } catch {
            print("Failed to start audio engine: \(error)")
        }
    }
    
    private func stopRecording() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionRequest = nil
        recognitionTask = nil
        isRecording = false
    }
    
    func deleteRecording() {
        transcript = ""
    }
    
    func submitRecording() {
        print("Submitting recording: \(transcript)")
        // Handle submission of the recording here
    }
    
    private func requestPermissions() {
            AVAudioSession.sharedInstance().requestRecordPermission { allowed in
                if !allowed {
                    // Handle case where user denied microphone access
                }
            }
            
            SFSpeechRecognizer.requestAuthorization { status in
                if status != .authorized {
                    // Handle case where user denied speech recognition access
                }
            }
        }
}
