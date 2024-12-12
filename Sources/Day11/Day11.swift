//
// Advent of Code 2024 Day 11
//
// https://adventofcode.com/2024/day/11
//

import AoCTools
import Foundation

final class Day11: AOCDay {
    let title = "Plutonian Pebbles"

    var stones: [Int]
    
    init(input: String) {
        stones = input.allInts()
    }
    
    private struct Key: Hashable {
        let stone: Int
        let blinks: Int
    }
    
    private var cache = [Key: Int]()

    private func expand(stone: Int, blinks: Int) -> Int {
        guard blinks > 0 else { return 1 }
        
        // return previously cached value if exists
        let key = Key(stone: stone, blinks: blinks)
        if let result = cache[key] {
            return result
        }
        
        let digits = String(stone).count
        let result: Int
        
        if stone == 0 {
            result = expand(stone: 1, blinks: blinks - 1)
        } else if digits.isMultiple(of: 2) {
            let power = pow(10, digits / 2)
            result = expand(stone: stone / power, blinks: blinks - 1) + expand(stone: stone % power, blinks: blinks - 1)
        } else {
            result = expand(stone: stone * 2024, blinks: blinks - 1)
        }
        
        cache[key] = result
        return result
    }

    private func blink(times blinks: Int) -> Int {
        stones
            .map { expand(stone: $0, blinks: blinks) }
            .sum()
    }

    func part1() -> Int {
        blink(times: 25)
    }

    func part2() -> Int {
        blink(times: 75)
    }
    
    private func pow(_ x: Int, _ y: Int) -> Int {
        Int(Foundation.pow(Double(x), Double(y)))
    }
}
