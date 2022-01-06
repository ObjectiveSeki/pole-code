
import XCTest
@testable import PoleCode


class LanternfishTests: XCTestCase {

    func test1() throws {
        let sut = Lanternfish(input: LanternfishInput.inputTest)
        let count = sut.fishCount(after: 2)
        XCTAssertEqual(count, 6)
    }
    
    func test2() throws {
        let sut = Lanternfish(input: [3,4,3,1,2])
        let count = sut.fishCount(after: 18)
        XCTAssertEqual(count, 26)
    }
    
    func test3() throws {
        let sut = Lanternfish(input: LanternfishInput.inputTest)
        let count = sut.fishCount(after: 80)
        XCTAssertEqual(count, 5934)
    }
    
    func test4() throws {
        let sut = Lanternfish(input: LanternfishInput.input)
        let count = sut.fishCountFast(after: 80)
        XCTAssertEqual(count, 385391)
    }
    
    func test5() throws {
        let sut = Lanternfish(input:LanternfishInput.input)
        let count = sut.fishCountFast(after: 256)
        XCTAssertEqual(count, 1728611055389)
    }
    
}
