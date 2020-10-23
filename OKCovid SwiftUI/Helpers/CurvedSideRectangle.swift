//
//  CurvedSideRectangle.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct CurvedSideRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY + 50))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY + 5),
                          control: CGPoint(x: rect.minX + 300, y: rect.maxY + 10))
        path.closeSubpath()
        
        return path
    }
}

struct CurvedSideRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CurvedSideRectangle()
            .frame(height: 300)
    }
}
