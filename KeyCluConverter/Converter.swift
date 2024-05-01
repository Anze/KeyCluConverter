//
//  Converter.swift
//  KeyCluConverter
//
//  Created by Anze on 01.05.24.
//

import SwiftUI

class Converter {
    private var bundleToConvert: String?
    private var fileToRead: String?
    private var fileToWrite: String?
    
    private let fileManager = FileManager.default
    private let fileReader = XmlReader()
    private let fileWriter = JsonWriter()
    
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
        print("2. --bundle-id <app-bundle-id>")
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
        
        print("Converting: \(bundle)")
        
        if !isFilePresent(atPath: fileFrom) {
            fatalError("File not found")
        }
        
        print("Reading: \(fileFrom)")
        
        let data: [String: ShortcutGroup] = fileReader.readData(from: fileFrom)
        if data.count > 0 {
            print("Writing: \(fileTo)")
            
            let dataToExport: [StringDataSet] = [
                (
                    Element: bundle,
                    Data: data
                )
            ]
            let urlTo = URL(fileURLWithPath: fileTo)
            let outString = fileWriter.customFormatJSON(data: dataToExport)
            do {
                try outString.write(to: urlTo, atomically: true, encoding: .utf8)
            } catch {
                fatalError("Error: \(error)")
            }
        }
    }
}
