//
//  ArrayExtension.swift
//  ComputorPackageDescription
//
//  Created by Collio quaynis Cummings on 09/11/2019.
//

import Foundation

extension Array {
    func allSatisfy(_ closure: (Element) -> Bool) -> Bool {
        for some in self {
            if !closure(some) {
                return false
            }
        }
        return true
    }
}
