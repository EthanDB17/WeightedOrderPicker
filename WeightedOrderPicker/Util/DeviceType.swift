//
//  DeviceType.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/21/24.
//

import Foundation
import UIKit

/// Singleton object used to access device information
struct DeviceType {
    
    static let shared = DeviceType()
    private init() { }
    
    /// Returns true if the current device is an iPhone
    var isIphone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    /// Returns true if the current device is an iPad
    var isiPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
