import SwiftUI

extension Color {
    init(segment active: Bool) {
        self.init("segment/" + (active ? "active" : "normal"))
    }
}

extension Set where Element == Segment {
    func color(for segment: Segment) -> Color {
        Color(segment: contains(segment))
    }

    mutating func toggle(_ segment: Segment) {
        if contains(segment) {
            remove(segment)
        } else {
            insert(segment)
        }
    }
}

#if DEBUG
struct Color_Segment_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            Color(segment: true)
            Color(segment: false)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
#endif
