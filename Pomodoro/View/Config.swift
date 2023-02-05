//
//  Config.swift
//  Pomodoro
//
//  Created by Vitor Trimer on 01/02/23.
//

import SwiftUI

struct Config: View {
    
    @State private var focusTimeValue = 0.0
    @State private var restTimeValue = 0.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack {
                SummaryView()
                TimePickerConfigView(pickerType: .focus, sliderValue: $focusTimeValue)
                TimePickerConfigView(pickerType: .rest, sliderValue: $restTimeValue)
                Spacer()
                VStack {
                    Button("Reset to default") {
                        
                    }
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .clipShape(Capsule())
                    .background(Color.black.opacity(0.08))
                    HStack(alignment: .center, spacing: 8) {
                        Button("Save") {
                            
                        }
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .clipShape(Capsule())
                        .background(Color.black.opacity(0.08))
                        Button("Cancel") {
                            
                        }
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .clipShape(Capsule())
                        .background(Color.black.opacity(0.08))
                    }
                }
                .padding(.bottom, 16)
            }
        }
    }
    
    @ViewBuilder
    func SummaryView() -> some View {
        HStack{
            VStack(alignment: .leading, spacing: 8) {
                Text("Current pomodoro config:")
                Text("Focus: \(Int(focusTimeValue))m")
                Text("Rest: \(Int(restTimeValue))m")
            }
        }
        .padding(16)
        .background(Color.white.opacity(0.1))
        .cornerRadius(16)
    }
    
    @ViewBuilder
    private func TimePickerConfigView(pickerType type: PickerType, sliderValue value: Binding<Double>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(type.rawValue):")
            Slider(
                value: value,
                in: 0...60,
                step: 1
            ) {
            }
            minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("60 minutes")
            }
            
        }
    }
    
    private enum PickerType: String {
        case rest = "Rest time"
        case focus = "Focus time"
    }
}

struct Config_Previews: PreviewProvider {
    static var previews: some View {
        Config()
    }
}
