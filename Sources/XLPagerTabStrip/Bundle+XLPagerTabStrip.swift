//
//  Bundle+CommonUI.swift
//  CommonUI
//
//  Created by VinhHT on 5/7/21.
//

import class Foundation.Bundle

private class BundleFinder {}

// Bundle For SPM
extension Bundle {
    static func bundle(for aClass: AnyClass) -> Bundle {
        let moduleName = String(reflecting: aClass).components(separatedBy: ".").first ?? ""
        let bundleName = "\(moduleName)_\(moduleName)"
        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: BundleFinder.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named \(bundleName)")
    }
}
