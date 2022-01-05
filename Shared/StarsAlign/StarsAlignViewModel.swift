
import SwiftUI


class StarsAlignVM: ObservableObject {
    
    var align = StarsAlign(with: StarsAlign.input)
    private var tick = 0
    @Published var text = ""
    @Published var tickText = "Tick: 0"
    
    func load() {
        align.fastForward()
        text = align.printStars()
    }
    func forward(_ times: String) {
        guard let t = Int(times) else { return }
        tick += t
        tickText = "Tick: \(tick)"
        align.forward(t)
        text = align.printStars()
    }
    func backwards(_ times: String) {
        guard let t = Int(times) else { return }
        tick -= t
        tickText = "Tick: \(tick)"
        align.forward(-1*t)
        text = align.printStars()
    }
    func fastForward(_ times: Int) {
        align.forward(times)
        text = align.printStars()
    }
    
}
