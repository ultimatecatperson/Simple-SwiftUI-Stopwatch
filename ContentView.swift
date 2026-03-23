// Created by Random Meow
// You may use any code here without credit.

import SwiftUI

struct ContentView: View {
    @State private var startTime: Double = 0
    @State private var endTime: Double = 0
    @State private var isRunning: Bool = false
    
    @State private var elapsedTime: Double = 0
    
    var body: some View {
        VStack {
            TimelineView(.animation) { context in
                Text(String(
                    format: "%.3f",
                    isRunning ? Date().timeIntervalSince1970 - startTime : elapsedTime)
                )
                    .font(.largeTitle.monospaced().weight(.semibold))
            }
            
            HStack {
                Button {
                    isRunning.toggle()
                    
                    if isRunning {
                        if elapsedTime == 0 {
                            startTime = Date().timeIntervalSince1970
                        } else {
                            startTime = Date().timeIntervalSince1970 - elapsedTime
                        }
                    } else {
                        endTime = Date().timeIntervalSince1970
                        elapsedTime = endTime - startTime
                    }
                } label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(isRunning ? .yellow : .green)
                        Image(systemName: isRunning ? "pause.fill" : "play.fill")
                            .foregroundStyle(.white)
                            .font(.system(size: 60))
                    }
                }
                .padding()
                
                Button {
                    isRunning = false
                    elapsedTime = 0
                } label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(.red)
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundStyle(.white)
                            .font(.system(size: 60))
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
