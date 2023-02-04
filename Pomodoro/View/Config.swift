//
//  Config.swift
//  Pomodoro
//
//  Created by Vitor Trimer on 01/02/23.
//

import SwiftUI

struct Config: View {
    
    @State private var speed = 0.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack {
                TimePickerConfig(pickerType: .focus)
            }
            Text("Time - \(speed)")
        }
    }
    
    
    @ViewBuilder
    private func TimePickerConfig(pickerType type: PickerType) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(type.rawValue):")
            Slider(
                value: $speed,
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
