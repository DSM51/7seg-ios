import SwiftUI

struct Hexadecimal: View {
  let value: Int

  var body: some View {
    Overlay(color: .blue) {
      HStack(spacing: 2) {
        Text("0x")
          .foregroundColor(.secondary)
        Text(String(format: "%.2X", value))
          .foregroundColor(.primary)
      }
    }
  }
}

struct Binary: View {
  let value: Int

  var body: some View {
    let string = String(value, radix: 2)
    let padded = String(repeating: "0", count: 8 - string.count) + string

    Overlay(color: .blue) {
      HStack(spacing: 2) {
        Text("0b")
          .foregroundColor(.secondary)
        Text(padded.prefix(4))
          .foregroundColor(.primary)
        Text(padded.suffix(4))
          .foregroundColor(.primary)
      }
    }
    .foregroundColor(.blue)
  }
}

private struct Overlay<Content: View>: View {
  let color: Color
  let content: () -> Content

  var body: some View {
    content()
      .font(.system(.body, design: .monospaced))
      .padding(.vertical, 10)
      .padding(.horizontal, 20)
      .cornerRadius(10)
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .stroke(color, lineWidth: 3)
      )
  }
}

#if DEBUG
struct Value_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Hexadecimal(value: 0b10101010)
      Binary(value: 0b10101010)
    }
  }
}
#endif
