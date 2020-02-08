//
//  main.swift
//  SUTI
//
//  Created by aryzae on 2020/02/09.
//  Copyright © 2020 aryzae. All rights reserved.
//

import Foundation

private func main(arguments: [String]) {
    let args = arguments.dropFirst()
    guard let filePath = args.first else {
        print("not exactly args")
        return
    }

    guard let fileExtenson = extractFileExtension(from: filePath) else {
        print("not file, this is directory")
        return
    }

    guard let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExtenson, nil)?.takeUnretainedValue() else {
        print("unknown UTI")
        return
    }
    print("UTI is")
    print(uti)
}

private func extractFileExtension(from filePath: String) -> CFString? {
    let filePaths = filePath.split(separator: ".")
    return filePaths.last as CFString?
}

main(arguments: CommandLine.arguments)
