import Foundation


struct Lanternfish {
    
    let input: [Int]
    var fish = [Int:Int]()
    
    
    // MARK: PoleApp
    
    mutating func initiateFishSpawning() {
        fish = [Int:Int]()
        for i in input {
            fish[i, default: 0] += 1
        }
    }
    mutating func incrementFish() {
        increment(&fish)
    }
    
    func currentFishSchool() -> Int {
        return fish
            .keys
            .map { fish[$0]! }
            .reduce(0, +)
    }
    
    
    // MARK: Advent of code
    
    func fishCount(after days: Int) -> Int {
        var fish = input
        for _ in 0..<days {
            for i in 0..<fish.count {
                if fish[i] == 0 {
                    fish.append(8)
                    fish[i] = 6
                } else {
                    fish[i] -= 1
                }
            }
        }
        return fish.count
    }
    
    func fishCountFast(after days: Int) -> Int {
        var fish = [Int:Int]()
        for i in input {
            fish[i, default: 0] += 1
        }
        for _ in 0..<days {
            increment(&fish)
        }
        return fish
            .keys
            .map { fish[$0]! }
            .reduce(0, +)
    }
    
    
    // MARK: Helper methods
    
    private func increment(_ fish: inout [Int : Int]) {
        let newBorns = fish[0, default: 0]
        for i in 1...8 {
            fish[i-1] = fish[i]
        }
        if newBorns > 0 {
            fish[8] = newBorns
            fish[6, default: 0] += newBorns
        } else {
            fish[8] = nil
        }
    }
    
}
