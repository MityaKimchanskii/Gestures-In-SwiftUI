//
//  Card.swift
//  Gestures-In-SwiftUI
//
//  Created by Mitya Kim on 7/17/22.
//

import SwiftUI

struct Card: View {
    
    let tapped: Bool
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        
        VStack {
            
            Image("user14")
                .resizable()
                .scaleEffect(self.scale)
                .frame(width: 150, height: 180)
                .cornerRadius(20)
                .gesture(MagnificationGesture()
                    .onChanged { value in
                        self.scale = value.magnitude
                    })
            
            Text("Card")
                .font(.title)
                .foregroundColor(.white)
            
        }.frame(width: 300, height: 300)
            .background(self.tapped ? .blue : .orange)
            .cornerRadius(30)
    }
}

struct Card_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        Card(tapped: false)
    }
}
