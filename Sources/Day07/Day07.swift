//
// Advent of Code 2024 Day 7
//
// https://adventofcode.com/2024/day/7
//

import AoCTools
import Parsing

private struct Instruction {
    let test: Int
    let numbers: [Int]

    init(test: Int, numbers: [Int]) {
        self.test = test
        self.numbers = numbers
    }

    struct Parser: Parsing.Parser {
        var body: some Parsing.Parser<Substring, Instruction> {
            Parse(Instruction.init(test:numbers:)) {
                Int.parser()
                ": "
                Many {
                    Int.parser()
                } separator: {
                    " "
                }
            }
        }
    }
}

final class Day07: AOCDay {
    let title = "Bridge Repair"
    private let instructions: [Instruction]

    init(input: String) {
        let ins = Many {
            Instruction.Parser()
        } separator: {
            "\n"
        }

        try! instructions = ins.parse(input)
    }

    private func solve(test: Int, operands: [Int], part2: Bool = false) -> Bool {
        // does the remaining operand match test?
        if operands.count == 1 { return operands.first == test }
        // if the last operand is a factor of the test
        // and the remaining factor is obtainable from the rest of the operands,
        // the instruction is valid
        if test % operands.last! == 0
            && solve(test: test / operands.last!, operands: Array(operands.dropLast()), part2: part2) {
            return true
        }
        // if the test is greater than the last operand
        // and we can obtain the test - last operand difference from the rest of the operands,
        // the instruction is valid
        if test > operands.last! && solve(test: test - operands.last!, operands: Array(operands.dropLast()), part2: part2) { return true }

        guard part2 else { return false }

        let testString = String(test)
        let lastString = String(operands.last!)
        let nextTest = Int(String(testString.dropLast(lastString.count))) ?? 0

        if testString.count > lastString.count
            && testString.hasSuffix(lastString)
            && solve(test: nextTest, operands: Array(operands.dropLast()), part2: part2) {
            return true
        }
        return false
    }

    func part1() -> Int {
        instructions
            .filter { solve(test: $0.test, operands: $0.numbers) }
            .sumOf(\.test)
    }

    func part2() -> Int {
        instructions
            .filter { solve(test: $0.test, operands: $0.numbers, part2: true) }
            .sumOf(\.test)
    }
}
