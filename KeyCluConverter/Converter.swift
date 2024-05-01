//
//  Converter.swift
//  KeyCluConverter
//
//  Created by Anze on 01.05.24.
//

import Foundation

class Converter {
    var bundleToConvert = ""
    var fileToRead = ""
    var fileToWrite = ""
    
    public func processCommandLineArguments() -> Bool {
        if CommandLine.arguments.contains("--bundle-id") {
            if let valueIndex = CommandLine.arguments.firstIndex(of: "--bundle-id") {
                if valueIndex + 1 < CommandLine.arguments.count {
                    bundleToConvert = CommandLine.arguments[valueIndex + 1]
                }
            }
            print("converting: \(bundleToConvert)")
            if bundleToConvert.isNotEmpty {
                if let valueIndex = CommandLine.arguments.firstIndex(of: "--from-file") {
                    if valueIndex + 1 < CommandLine.arguments.count {
                        fileToRead = CommandLine.arguments[valueIndex + 1]
                    }
                }
                
                if let valueIndex = CommandLine.arguments.firstIndex(of: "--to-file") {
                    if valueIndex + 1 < CommandLine.arguments.count {
                        fileToWrite = CommandLine.arguments[valueIndex + 1]
                    }
                }
                
                print("fileToRead: \(fileToRead)")
                print("fileToWrite: \(fileToWrite)")
            } else {
                printHelp()
                return false
            }
        } else {
            printHelp()
            return false
        }
        return true
    }
    
    private func printHelp() -> Void {
        print("KeyClu Converter v\(Bundle.main.buildVersion) (\(Bundle.main.buildNumber))")
        print("Available options:")
        print("1. --help")
        print("2. --bundle-id <bundle-id-to-use>")
        print("   --from-file <path-file-from>")
        print("   --to-file <path-file-to>")
    }
}
