//
//  ContentView.swift
//  7-segment
//
//  Created by Damian Rzeszot on 01/11/2020.
//

import SwiftUI

struct ContentView: View {

    @State
    var state: Set<Segment> = []

    var body: some View {
        VStack {
            SegmentView(active: $state)
                .frame(width: 200, height: 300)
                .offset(x: -50, y: 0)
            Divider()
                .padding(.vertical, 20)

            Text("Decimal: " + String(state.value))
            Text("Hexadecimal: " + String(state.value, radix: 16))
            Text("Binary: " + String(state.value, radix: 2))
        }
        .foregroundColor(Color.white)
        .background(Color("background"))
    }
}

extension Set where Element == Segment {
    var value: Int {
        var sum: Int = 0

        for element in self {
            sum += 1 << Segment.allCases.firstIndex(of: element)!
        }

        return sum
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
