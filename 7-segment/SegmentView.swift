//
//  SegmentView.swift
//  7Seg
//
//  Created by Damian Rzeszot on 01/11/2020.
//

import SwiftUI

enum Segment: CaseIterable {
    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
}

struct SegmentView: View {

    @Binding
    var active: Set<Segment>

    var body: some View {
        ZStack {
            Vertical() // f
                .fill(color(for: .f))
                .frame(width: 25, height: 90)
                .onTapGesture(perform: { tap(.f) } )

            Vertical() // b
                .fill(color(for: .b))
                .frame(width: 25, height: 90)
                .offset(x: 100, y: 0)
                .onTapGesture(perform: { tap(.b) } )

            Vertical() // a
                .fill(color(for: .a))
                .frame(width: 25, height: 90)
                .rotationEffect(Angle(degrees: 90))
                .offset(x: 50.0, y: -50.0)
                .onTapGesture(perform: { tap(.a) } )

            Vertical() // g
                .fill(color(for: .g))
                .frame(width: 25, height: 90)
                .rotationEffect(Angle(degrees: 90))
                .offset(x: 50.0, y: 50.0)
                .onTapGesture(perform: { tap(.g) } )

            Vertical() // e
                .fill(color(for: .e))
                .frame(width: 25, height: 90)
                .offset(x: 0, y: 100)
                .onTapGesture(perform: { tap(.e) } )

            Vertical() // c
                .fill(color(for: .c))
                .frame(width: 25, height: 90)
                .offset(x: 100, y: 100)
                .onTapGesture(perform: { tap(.c) } )

            Vertical() // d
                .fill(color(for: .d))
                .frame(width: 25, height: 90)
                .rotationEffect(Angle(degrees: 90))
                .offset(x: 50.0, y: 150.0)
                .onTapGesture(perform: { tap(.d) } )

            Circle() // h
                .fill(color(for: .h))
                .frame(width: 25, height: 25)
                .offset(x: 130, y: 150)
                .onTapGesture(perform: { tap(.h) } )
        }
    }

    func color(for segment: Segment) -> Color {
        Color("number/" + (active.contains(segment) ? "active" : "normal"))
    }

    func tap(_ segment: Segment) {
        if active.contains(segment) {
            active.remove(segment)
        } else {
            active.insert(segment)
        }
        print("tap \(segment)")
    }


    struct Vertical: Shape {
        func path(in rect: CGRect) -> Path {
            let cut: CGFloat = rect.height * 0.13

            let top = CGPoint(x: rect.midX, y: 0)
            let bottom = CGPoint(x: rect.midX, y: rect.maxY)

            let leftUpper = CGPoint(x: 0, y: rect.minY + cut)
            let leftLower = CGPoint(x: 0, y: rect.maxY - cut)

            let rightUpper = CGPoint(x: rect.maxX, y: rect.minY + cut)
            let rightLower = CGPoint(x: rect.maxX, y: rect.maxY - cut)

            var path = Path()

            path.move(to: top)
            path.addLines([
                rightUpper,
                rightLower,
                bottom,
                leftLower,
                leftUpper,
                top
            ])

            return path
        }
    }
}

//struct SegmentView_Previews: PreviewProvider {
//    static var previews: some View {
//        SegmentView(active: <#Binding<Set<SegmentView.Segment>>#>)
//    }
//}
