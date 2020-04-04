//
//  NeumorphismButtonStyle.swift
//  NeumorphismSwiftUI
//
//  Created by Shinji Kurosawa on 2020/04/04.
//  Copyright © 2020 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

struct NeumorphismButtonStyle<S: Shape>: ButtonStyle {
    
    enum ColorType {
        case light
        case dark
        case colorful
    }
    
    var color: ColorType
    var shape: S
    
    init(colorScheme: ColorScheme, shape: S, usesColorful: Bool) {
        if colorScheme == .light {
            self.color = .light
        } else {
            if usesColorful {
                self.color = .colorful
            } else {
                self.color = .dark
            }
        }
        self.shape = shape
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        containedView(configuration: configuration)
    }
    
    private func containedView(configuration: Self.Configuration) -> AnyView {
        switch self.color {
        case .light: return AnyView(makeLight(configuration: configuration))
        case .dark: return AnyView(makeDark(configuration: configuration))
        case .colorful: return AnyView(makeColorful(configuration: configuration)) 
        }
    }
    
    private func makeLight(configuration: Self.Configuration) -> some View {
        configuration.label
                .padding(30)
                .background(
                    Group {
                        if configuration.isPressed {
                            shape
                                .fill(Color.offWhite)
                                .overlay(
                                    shape
                                        .stroke(Color.gray, lineWidth: 4)
                                        .blur(radius: 4)
                                        .offset(x: 2, y: 2)
                                        .mask(shape.fill(LinearGradient(Color.black, Color.clear)))
                                )
                                .overlay(
                                    shape
                                        .stroke(Color.white, lineWidth: 8)
                                        .blur(radius: 4)
                                        .offset(x: -2, y: -2)
                                        .mask(shape.fill(LinearGradient(Color.clear, Color.white)))
                                )
                        } else {
                            shape
                                .fill(Color.offWhite)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        }
                    }
                )
    }
    
    private func makeDark(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(shape)
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape: shape)
            )
            .animation(nil)
    }
    
    private func makeColorful(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(shape)
            .background(
                ColorfulBackground(isHighlighted: configuration.isPressed, shape: shape, start: .darkOrangeStart, end: .darkOrangeEnd)
            )
            .animation(nil)
    }
}
