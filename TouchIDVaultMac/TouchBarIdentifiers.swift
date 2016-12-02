//
//  TouchBarIdentifiers.swift
//  TouchIDVaultMac
//
//  Created by Tanmay Bakshi on 2016-11-18.
//  Copyright © 2016 Tanmay Bakshi. All rights reserved.
//

import Cocoa

extension NSTouchBarItemIdentifier {
    static let unlockButton = NSTouchBarItemIdentifier("com.TBSSTouchBar.unlockButton")
    static let lockButton = NSTouchBarItemIdentifier("com.TBSSTouchBar.lockButton")
}

extension NSTouchBarCustomizationIdentifier {
    static let unlockBar = NSTouchBarCustomizationIdentifier("com.TBSSTouchBar.tIDVault.Unlock")
    static let lockBar = NSTouchBarCustomizationIdentifier("com.TBSSTouchBar.tIDVault.Lock")
}
