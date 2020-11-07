import SwiftUI

struct Diode: Shape {
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: rect.topCenter)

            if !corners.contains(.topRight) {
                path.addLine(to: rect.topRight)
            }

            path.addLine(to: rect.rightUpper)
            path.addLine(to: rect.rightLower)

            if !corners.contains(.bottomRight) {
                path.addLine(to: rect.bottomRight)
            }

            path.addLine(to: rect.bottomCenter)

            if !corners.contains(.bottomLeft) {
                path.addLine(to: rect.bottomLeft)
            }

            path.addLine(to: rect.leftLower)
            path.addLine(to: rect.leftUpper)

            if !corners.contains(.topLeft) {
                path.addLine(to: rect.topLeft)
            }
        }
    }
}

private extension CGRect {
    var cut: CGFloat {
        min(midX, midY)
    }

    var topLeft: CGPoint {
        .init(x: minX, y: minY)
    }

    var topCenter: CGPoint {
        .init(x: midX, y: minY)
    }

    var topRight: CGPoint {
        .init(x: maxX, y: minY)
    }

    var bottomLeft: CGPoint {
        .init(x: minX, y: maxY)
    }

    var bottomCenter: CGPoint {
        .init(x: midX, y: maxY)
    }

    var bottomRight: CGPoint {
        .init(x: maxX, y: maxY)
    }

    var leftUpper: CGPoint {
        .init(x: minX, y: minY + cut)
    }

    var leftLower: CGPoint {
        .init(x: minX, y: maxY - cut)
    }

    var rightUpper: CGPoint {
        .init(x: maxX, y: minY + cut)
    }

    var rightLower: CGPoint {
        .init(x: maxX, y: maxY - cut)
    }
}

#if DEBUG
struct Diode_Previews: PreviewProvider {
    static var previews: some View {
        Diode()
            .background(Color.yellow)
    }
}
#endif
