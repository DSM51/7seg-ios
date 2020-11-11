import SwiftUI

class Model: ObservableObject {

  @Published
  var active: Set<Segment>

  init(active: Set<Segment> = []) {
    self.active = active
  }

  func toggle(_ segment: Segment) {
    if active.contains(segment) {
      active.remove(segment)
    } else {
      active.insert(segment)
    }
  }

  func color(for segment: Segment) -> Color {
    if active.contains(segment) {
      return .accentColor
    } else {
      return Color.secondary.opacity(0.3)
    }
  }

  func number() -> Int {
    active
      .compactMap(Segment.allCases.firstIndex(of:))
      .map { 1 << $0 }
      .reduce(0) { $0 + $1 }
  }
}
