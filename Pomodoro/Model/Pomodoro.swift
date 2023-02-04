//
//  Pomodoro.swift
//  Pomodoro
//
//  Created by Vitor Trimer on 27/01/23.
//

import Foundation

struct Pomodoro: Identifiable, Hashable, Equatable {
    var id: UUID = .init()
    var focusTime: String
    var restTime: String
}
