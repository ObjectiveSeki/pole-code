
import Foundation


struct StarsAlign {
    
    static let inputTest = StarsAlignInput.inputTest
    static let input = StarsAlignInput.input
    let gridSize = 100
    let origo = -119
    
    var points = [[[Int]]]()
    
    init(with input: String) {
        points = points(from: input)
        fastForward()
    }
    
    func points(from input: String) -> [[[Int]]] {
        return input
            .components(separatedBy: .newlines)
            .map {
                $0.components(separatedBy: ["<", ">"])
                .filter { $0.contains(",") }
                .map {
                    $0.components(separatedBy: ",")
                    .map { Int($0.trimmingCharacters(in: .whitespaces))! }
                }
            }
    }
    
    mutating func fastForward(_ times: Int) {
        for i in 0..<points.count {
            let vx = points[i][1][0]
            let vy = points[i][1][1]
            points[i][0][0] += vx * times
            points[i][0][1] += vy * times
        }
    }
    
    mutating func fastForward() {
        fastForward(10870)
    }
    
    func printt() -> String {
        var matrix = Array(repeating: Array(repeating: " ", count: gridSize), count: gridSize)
        for i in points {
            let x = i[0][1]
            let y = i[0][0]
            if (x + origo) < 0 { continue }
            if (x + origo) > (gridSize - 1) { continue }
            if (y + origo) < 0 { continue }
            if (y + origo) > (gridSize - 1) { continue }
            matrix[x+origo][y+origo] = "|"
        }

        var string = ""
        for m in matrix {
            for n in m {
                string.append(contentsOf: n)
            }
            string.append(contentsOf: "\n")
        }
        return string
    }
    
}
