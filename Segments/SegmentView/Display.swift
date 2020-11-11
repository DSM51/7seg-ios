import SwiftUI

struct Display: View {
  @Binding
  var active: Set<Segment>

  var body: some View {
    GeometryReader { geometry in
      Diode() // a
        .fill(active.color(for: .a))
        .frame(
          width: geometry.size.width * 26 / 120,
          height: geometry.size.height * 90 / 200
        )
        .rotationEffect(.init(degrees: -90), anchor: .topLeading)
        .offset(
          x: (geometry.size.width - geometry.size.height * 90 / 200) / 2,
          y: geometry.size.width * 26 / 120
        )
        .onTapGesture(perform: { tap(.a) })

      Diode() // g
        .fill(active.color(for: .g))
        .frame(
          width: geometry.size.width * 26 / 120,
          height: geometry.size.height * 90 / 200
        )
        .rotationEffect(.init(degrees: -90), anchor: .topLeading)
        .offset(
          x: (geometry.size.width - geometry.size.height * 90 / 200) / 2,
          y: (geometry.size.height + geometry.size.width * 26 / 120) / 2
        )
        .onTapGesture(perform: { tap(.g) })

      Diode() // d
        .fill(active.color(for: .d))
        .frame(
          width: geometry.size.width * 26 / 120,
          height: geometry.size.height * 90 / 200
        )
        .rotationEffect(.init(degrees: -90), anchor: .topLeading)
        .offset(
          x: (geometry.size.width - geometry.size.height * 90 / 200) / 2,
          y: geometry.size.height
        )
        .onTapGesture(perform: { tap(.d) })

      Diode(corners: [.topLeft, .topRight, .bottomRight]) // f
        .fill(active.color(for: .f))
        .frame(
          width: geometry.size.width * 26 / 120,
          height: geometry.size.height * 83 / 200
        )
        .offset(
          x: 0,
          y: geometry.size.height * 15 / 200
        )
        .onTapGesture(perform: { tap(.f) })

      Diode(corners: [.bottomLeft, .topRight, .topLeft]) // b
        .fill(active.color(for: .b))
        .frame(
          width: geometry.size.width * 26 / 120,
          height: geometry.size.height * 83 / 200
        )
        .offset(
          x: geometry.size.width * (120 - 26) / 120,
          y: geometry.size.height * 15 / 200
        )
        .onTapGesture(perform: { tap(.b) })

      Diode(corners: [.bottomLeft, .bottomRight, .topLeft]) // c
        .fill(active.color(for: .c))
        .frame(
          width: geometry.size.width * 26 / 120,
          height: geometry.size.height * 83 / 200
        )
        .offset(
          x: geometry.size.width * (120 - 26) / 120,
          y: geometry.size.height * 102 / 200
        )
        .onTapGesture(perform: { tap(.c) })

      Diode(corners: [.bottomLeft, .topRight, .bottomRight]) // e
        .fill(active.color(for: .e))
        .frame(
          width: geometry.size.width * 26 / 120,
          height: geometry.size.height * 83 / 200
        )
        .offset(
          x: 0,
          y: geometry.size.height * 102 / 200
        )
        .onTapGesture(perform: { tap(.e) })
    }
    .aspectRatio(120 / 200, contentMode: .fit)
  }

  private func tap(_ segment: Segment) {
      active.toggle(segment)
  }
}

extension Set where Element == Segment {
  func color(for segment: Segment) -> Color {
    if contains(segment) {
      return .accentColor
    } else {
      return .secondary
    }
  }

  mutating func toggle(_ segment: Segment) {
    if contains(segment) {
      remove(segment)
    } else {
      insert(segment)
    }
  }
}
