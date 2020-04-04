//
//  NeumorphismButton.swift
//  NeumorphismSwiftUI
//
//  Created by Shinji Kurosawa on 2020/04/04.
//  Copyright © 2020 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

struct NeumorphismButton<S: Shape, V: View>: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    let contentView: V
    let shape: S
    let lightTintColor: Color
    let darkTintColor: Color
    let usesColorful: Bool
    let action: () -> Void
    
    init(contentView: V, 
         shape: S,
         lightTintColor: Color = .gray, 
         darkTintColor: Color = .gray,
         usesColorful: Bool = false,
         action: @escaping () -> Void) {
        self.contentView = contentView
        self.lightTintColor = lightTintColor
        self.darkTintColor = darkTintColor
        self.shape = shape
        self.usesColorful = usesColorful
        self.action = action
    }
    
    var body: some View {
        GeometryReader { geometry in
            Button(action: self.action) {
                self.contentView
                    .frame(width: geometry.size.width-60, height: geometry.size.height-60)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(self.colorScheme == .light ? self.lightTintColor : self.darkTintColor)
            }
            .buttonStyle(NeumorphismButtonStyle(colorScheme: self.colorScheme, shape: self.shape, usesColorful: self.usesColorful))
        }
    }
}

struct NeumorphismButton_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphismButton(contentView: Text("1"), shape: Circle()) { }
    }
}
