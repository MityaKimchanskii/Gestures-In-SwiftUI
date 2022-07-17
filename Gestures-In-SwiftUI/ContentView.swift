//
//  ContentView.swift
//  Gestures-In-SwiftUI
//
//  Created by Mitya Kim on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapped: Bool = false
    @State private var cardDragState = CGSize.zero
    @State private var cardRotateState: Double = 0
    
    var body: some View {
        
        Card(tapped: self.tapped)
            .animation(.easeOut, value: 20)
            .offset(x: self.cardDragState.width, y: self.cardDragState.height)
            .rotationEffect(Angle(degrees: self.cardRotateState))
        
            .gesture(RotationGesture()
                .onChanged { value in
                    self.cardRotateState = value.degrees
                }
            )
        
            .gesture(DragGesture()
                .onChanged { value in
                    self.cardDragState = value.translation
                }
                .onEnded { value in
                    self.cardDragState = CGSize.zero
                }
            )
        
            .gesture(TapGesture(count: 1).onEnded { () in
                self.tapped.toggle()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
