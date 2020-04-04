//
//  CalculatorView.swift
//  NeumorphismSwiftUI
//
//  Created by Shinji Kurosawa on 2020/04/03.
//  Copyright © 2020 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

struct CalculatorView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        GeometryReader { geometry in 
            ZStack {
                Group {
                    if self.colorScheme == .dark {
                        LinearGradient(Color.darkStart, Color.darkEnd)
                    } else {
                        Color.offWhite
                    }
                }
                
                VStack(spacing: 14) {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Text("100").font(.largeTitle)
                            .padding(20)
                    }
                        
                    HStack(spacing: 15) {
                        NeumorphismButton(contentView: Text("C"), shape: Circle(), lightTintColor: .black, darkTintColor: .white) {  }
                            .circleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Image(systemName: "plus.slash.minus"), shape: Circle(), lightTintColor: .black, darkTintColor: .white) {  }
                            .circleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Text("%"), shape: Circle(), lightTintColor: .black, darkTintColor: .white) {  }
                            .circleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Text("÷"), shape: Circle(), lightTintColor: .orange, darkTintColor: .white, usesColorful: true) {  }
                            .circleFrame(geometry: geometry)
                    }
                    HStack(spacing: 15) {
                        NeumorphismButton(contentView: Text("7"), shape: Circle()) {  }
                            .circleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Text("8"), shape: Circle()) {  }
                            .circleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Text("9"), shape: Circle()) {  }
                            .circleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Text("×"), shape: Circle(), lightTintColor: .orange, darkTintColor: .white, usesColorful: true) {  }
                            .circleFrame(geometry: geometry)
                    }
                    HStack(spacing: 15) {
                        NeumorphismButton(contentView: Text("4"), shape: Circle()) {  }
                            .circleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Text("5"), shape: Circle()) {  }
                            .circleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Text("6"), shape: Circle()) {  }
                            .circleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Text("-"), shape: Circle(), lightTintColor: .orange, darkTintColor: .white, usesColorful: true) {  }
                            .circleFrame(geometry: geometry)
                    }
                    HStack(spacing: 15) {
                        NeumorphismButton(contentView: Text("1"), shape: Circle()) {  }
                            .circleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Text("2"), shape: Circle()) {  }
                            .circleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Text("3"), shape: Circle()) {  }
                            .circleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Text("+"), shape: Circle(), lightTintColor: .orange, darkTintColor: .white, usesColorful: true) {  }
                            .circleFrame(geometry: geometry)
                    }
                    HStack(spacing: 15) {
                        NeumorphismButton(contentView: Text("0"), shape: Capsule()) {  }
                            .capsuleframe(geometry: geometry)
                        NeumorphismButton(contentView: Text("."), shape: Circle()) {  }
                            .withCapsuleCircleFrame(geometry: geometry)
                        NeumorphismButton(contentView: Text("="), shape: Circle(), lightTintColor: .orange, darkTintColor: .white, usesColorful: true) {  }
                            .withCapsuleCircleFrame(geometry: geometry)
                    }
                }
                .padding(60)
                .frame(width: geometry.size.width, alignment: .center)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalculatorView().environment(\.colorScheme, .light)
            CalculatorView().environment(\.colorScheme, .dark)
        }
    }
} 

private extension View {
    
    func circleFrame(geometry: GeometryProxy) -> some View {
        return self.frame(
            width: equallyRowContentWidth(geometry: geometry),
            height: equallyRowContentWidth(geometry: geometry)
        )
    }
    
    func capsuleframe(geometry: GeometryProxy) -> some View {
        return self.frame(
            width: capsuleRowContentWidth(geometry: geometry)*2+7.5,
            height: capsuleRowContentWidth(geometry: geometry)
        )
    }
    
    func withCapsuleCircleFrame(geometry: GeometryProxy) -> some View {
        return self.frame(
            width: capsuleRowContentWidth(geometry: geometry),
            height: capsuleRowContentWidth(geometry: geometry)
        )
    }
    
    private func equallyRowContentWidth(geometry: GeometryProxy) -> CGFloat {
        return (geometry.size.width - 75) / 4
    }
    
    private func capsuleRowContentWidth(geometry: GeometryProxy) -> CGFloat {
        return (geometry.size.width - 60) / 4
    }
}
