//
//  Background.swift
//  BookApi
//
//  Created by Luka Šalipur on 4.7.22..
//

import SwiftUI

struct Background: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
            
        path.move(to: CGPoint.zero)
        path.addLine(to:CGPoint(x:rect.maxX, y:rect.minY))
        path.addLine(to: CGPoint(x:rect.maxX, y:rect.maxY))
        path.addQuadCurve(to: CGPoint(x:rect.minX, y:rect.maxY), control:   CGPoint(x:rect.midX, y:rect.maxY + 100))
        path.closeSubpath()
        
      
        return path
    }
    

}
    
struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
            .frame(height:300)
    }
}
