
import Foundation
import SwiftUI


class LanternfishViewModel: ObservableObject {
    
    private var lanternfish: Lanternfish
    private var timer: Timer!
    
    @Published private(set) var slices = [PieSliceData]()
    var total = 0
    var values = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    var colors = [Color.random, .random, .random, .random, .random, .random, .random, .random, .random]
    var names: [String] {
        var names = [String]()
        for (index, _) in values.enumerated() {
            names.append("Lanterns on age timer: \(index)")
        }
        return names
    }
    
    init(lanternfish: Lanternfish) {
        self.lanternfish = lanternfish
        self.lanternfish.initiateFishSpawning()
        for lantern in self.lanternfish.fish {
            values[lantern.key] = Double(lantern.value)
        }
        updatePieSliceData()
    }
    
    func load() {
        var currentDay = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1/16, repeats: true) { timer in
            if currentDay == 256 {
                timer.invalidate()
                return
            }
            self.lanternfish.incrementFish()
            self.total = self.lanternfish.currentFishSchool()
            for lantern in self.lanternfish.fish {
                self.values[lantern.key] = Double(lantern.value)
            }
            self.updatePieSliceData()
            currentDay += 1
        }
    }
    
    private func updatePieSliceData() {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in self.lanternfish.fish.sorted(by: {$0.key < $1.key}).enumerated() {
            let degrees: Double
            if value.value == 0 {
                degrees = 0.0
            } else {
                degrees = Double(value.value) * 360 / sum
            }
            let text: String
            if sum == 0.0 {
                text = "0"
            } else {
                text = String(format: "%.0f%%", Double(value.value) * 100 / sum)
            }
            tempSlices.append(PieSliceData(
                id: i.formatted,
                text: text,
                startAngle: Angle(degrees: endDeg),
                endAngle: Angle(degrees: endDeg + degrees),
                color: colors[i]
            ))
            endDeg += degrees
        }
        slices = tempSlices
    }

}
