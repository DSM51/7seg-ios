import SwiftUI

struct ContentView: View {

  @ObservedObject
  var model: Model = .init()

  var body: some View {
    VStack {
      Spacer()

      HStack(alignment: .bottom) {
        SegmentView(active: model)
        Circle()
            .foregroundColor(model.color(for: .h))
            .frame(width: 40, height: 40)
            .onTapGesture {
              model.toggle(.h)
            }
      }
      .padding(.horizontal, 50)

      Divider()
        .padding(.vertical, 20)
        .padding(.horizontal, 20)

      Hexadecimal(value: model.number())
      Binary(value: model.number())

      Spacer()
    }
    .edgesIgnoringSafeArea(.all)
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
