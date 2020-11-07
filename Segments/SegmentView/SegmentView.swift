import SwiftUI

struct SegmentView: View {

    @Binding
    var active: Set<Segment>

    var body: some View {
        HStack(alignment: .bottom) {
            Display(active: $active)

            Circle()
                .foregroundColor(active.color(for: .h))
                .frame(width: 40, height: 40)
                .onTapGesture {
                    active.toggle(.h)
                }
        }
    }
}

#if DEBUG
struct SegmentView_Previews: PreviewProvider {
  static var previews: some View {
    var active = Set<Segment>()
    return SegmentView(active: Binding(get: { active }, set: { active = $0 }))
  }
}
#endif
