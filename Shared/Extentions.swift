
import SwiftUI


extension Int {
    var formatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let number = NSNumber(value: self)
        return formatter.string(from: number) ?? ""
    }
}

extension Color {
    static var random: Color {
        return Color(
            red:.random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: 1
        )
    }
    static var lanternBackground: Color {
        return Color(
            red: 21*2 / 255,
            green: 24*2 / 255,
            blue: 30*2 / 255,
            opacity: 1.0
        )
    }
}
