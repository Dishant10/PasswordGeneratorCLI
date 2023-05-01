// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser
import Foundation

struct PWGenerator : ParsableCommand{
    static let configuration = CommandConfiguration(abstract:"Generates a random password",version:"1.0.0")
    
    @Argument(help:"Specifies length") var length = 8
    @Flag(name: .short,help: "Include uppercase letters") var upperCase = false
    @Flag(name: .short,help: "Include special characters") var specialChar = false
    @Flag(name: .short,help: "Include numbers") var numbers = false
    
    mutating func run() throws {
        let ucase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let digits = "0123456789"
        let lcase = ucase.lowercased()
        let symbols = "!@#%&*?^;"
        var pw = ""
        for _ in 0...length-1{
            if upperCase {
                if Bool.random(){
                    pw = pw + String(ucase.randomElement()!)
                    continue
                }
            }
            if numbers {
                if Bool.random(){
                    pw = pw + String(digits.randomElement()!)
                    continue
                }
            }
            if specialChar {
                if Bool.random(){
                    pw=pw+String(symbols.randomElement()!)
                    continue
                }
            }
            pw=pw+String(lcase.randomElement()!)
        }
        print(pw)
    }
}

PWGenerator.main()
