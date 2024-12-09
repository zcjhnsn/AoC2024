//
// Advent of Code 2024 Day 9
//
// https://adventofcode.com/2024/day/9
//

import AoCTools

final class Day09: AOCDay {
    let title = "Disk Fragmenter"

    private struct File {
        let position: Int
        let value: Int
    }

    private typealias FileID = Int
    private typealias Files = [FileID: File]

    private let diskMap: [Int]

    init(input: String) {
        diskMap = input.map { Int($0.description)! }
    }

    func part1() -> Int {
        var disk: [Int] = []
        var blanks: [Int] = []
        // fill in disk
        var id = 0
        for (idx, num) in diskMap.enumerated() {
            if idx % 2 == 0 {
                disk.append(contentsOf: Array(repeating: id, count: num))
                id += 1
            } else {
                disk.append(contentsOf: Array(repeating: -1, count: num))
            }
        }

        // get location of all the blanks (denoted by -1)
        blanks = disk.enumerated().compactMap { (index, value) in
            value == -1 ? index : nil
        }

        for i in blanks {
            // remove trailing blanks
            while disk.last! == -1 { _ = disk.popLast() }
            if disk.count <= i { break }
            // move fileID to empty space
            disk[i] = disk.popLast()!
        }

        return disk
            .enumerated()
            .map { (index, value) in
                index * value
            }
            .sum()
    }

    func part2() -> Int {
        var files: Files = [:]
        var blanks: [File] = []

        var id = 0
        var pos = 0

        for (idx, num) in diskMap.enumerated() {
            if idx % 2 == 0 {
                // this case isn't explained in the problem statement
                if num == 0 { fatalError("Unexpected num = 0 for file") }
                files[id] = File(position: pos, value: num)
                id += 1
            } else {
                // only track non-empty blanks
                if num != 0 {
                    blanks.append(File(position: pos, value: num))
                }
            }
            pos += num
        }

        while id > 0 {
            id -= 1
            let file = files[id]!
            for (idx, blank) in blanks.enumerated() {
                // we've searched further than needed, so get rid of trailing blanks
                if blank.position >= file.position {
                    blanks = Array(blanks[..<idx])
                    break
                }
                if file.value <= blank.value {
                    files[id] = File(position: blank.position, value: file.value)
                    // no need to replace blanks if file fits perfectly
                    if file.value == blank.value {
                        blanks.remove(at: idx)
                    } else {
                        // add left over space back to blanks
                        blanks[idx] = File(position: blank.position + file.value, value: blank.value - file.value)
                    }
                    break
                }
            }
        }

        var total = 0
        for fileId in files.keys {
            let file = files[fileId]!
            for x in file.position..<(file.position + file.value) {
                total += fileId * x
            }

        }
        return total
    }
}
