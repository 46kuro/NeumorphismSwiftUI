//
//  ColorfulBackground.swift
//  NeumorphismSwiftUI
//
//  Created by Shinji Kurosawa on 2020/04/04.
//  Copyright © 2020 Shinji Kurosawa. All rights reserved.
//
// Reference: https://www.hackingwithswift.com/articles/213/how-to-build-neumorphic-designs-with-swiftui

import SwiftUI

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    let start: Color
    let end: Color
    
    init(isHighlighted: Bool, shape: S, start: Color = .darkStart, end: Color = .darkEnd) {
        self.isHighlighted = isHighlighted
        self.shape = shape
        self.start = start
        self.end = end
    }
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(self.end, self.start))
                    .overlay(shape.stroke(LinearGradient(self.start, self.end), lineWidth: 4))
                    .shadow(color: .darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: .darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(.darkStart, .darkEnd))
                    .overlay(shape.stroke(LinearGradient(self.start, self.end), lineWidth: 4))
                    .shadow(color: .darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: .darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}
