//
//  AppDelegate.swift
//  qrcodefromselection
//
//  Created by oz on 7/13/22.
//

import Cocoa
import Foundation

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApplication.shared.servicesProvider = QRCodeServiceProvider()
        NSUpdateDynamicServices()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}

