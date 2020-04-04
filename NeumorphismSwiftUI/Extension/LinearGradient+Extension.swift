//
//  LinearGradient+Extension.swift
//  NeumorphismSwiftUI
//
//  Created by Shinji Kurosawa on 2020/04/04.
//  Copyright © 2020 Shinji Kurosawa. All rights reserved.
//
// Reference: https://www.hackingwithswift.com/articles/213/how-to-build-neumorphic-designs-with-swiftui

import SwiftUI

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
