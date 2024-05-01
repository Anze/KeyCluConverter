//
//  Converter.swift
//  KeyCluConverter
//
//  Created by Anze on 01.05.24.
//

import Foundation

class Converter {
    private var bundleToConvert: String?
    private var fileToRead: String?
    private var fileToWrite: String?
    
    private let fileManager = FileManager.default
    
    public func processCommandLineArguments() -> Bool {
        if CommandLine.arguments.contains("--bundle-id") {
            if let valueIndex = CommandLine.arguments.firstIndex(of: "--bundle-id") {
                if valueIndex + 1 < CommandLine.arguments.count {
                    bundleToConvert = CommandLine.arguments[valueIndex + 1]
                }
            }
            
            guard let bundle = bundleToConvert else {
                printHelp()
                return false
            }
            
            if bundle.isNotEmpty {
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
                
                if let _ = fileToRead, let _ = fileToWrite {
                    convert()
                    return true
                }
            }
        }
        printHelp()
        return false
    }
    
    private func printHelp() -> Void {
        print("KeyClu Converter v\(Bundle.main.buildVersion) (\(Bundle.main.buildNumber))")
        print("Available options:")
        print("1. --help")
        print("2. --bundle-id <bundle-id-to-use>")
        print("   --from-file <path-file-from>")
        print("   --to-file <path-file-to>")
    }
    
    private func isFilePresent(atPath path: String) -> Bool {
        return fileManager.fileExists(atPath: path)
    }
    
    private func convert() -> Void {
        guard let bundle = bundleToConvert, let fileFrom = fileToRead, let fileTo = fileToWrite else {
            printHelp()
            return
        }
        print("converting: \(bundle)")
        
        print("reading: \(fileFrom)")
        
        print("writing: \(fileTo)")
        
    }
}
