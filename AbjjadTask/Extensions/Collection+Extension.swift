//
//  Collection+Extension.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
