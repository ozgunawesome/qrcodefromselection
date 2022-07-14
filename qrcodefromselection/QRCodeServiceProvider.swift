//
//  QRCodeServiceProvider.swift
//  qrcodefromselection
//
//  Created by oz on 7/13/22.
//

import Cocoa
import Foundation

class QRCodeServiceProvider: NSObject {

    @objc func qrcodeservice(_ pasteboard: NSPasteboard, userData: String?, error: AutoreleasingUnsafeMutablePointer<NSString>) {
        guard let str = pasteboard.string(forType: .string) else {
            showErrorMessage(with: error.pointee as String)
            return
        }
    
        let controller = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
            .instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("qrCodeWindowViewController")) as! QRCodeWindowViewController
        controller.qrString = str

        let qrCodeWindow = NSWindow(contentViewController: controller)
        if (controller.codeDrawn) {
            qrCodeWindow.makeKeyAndOrderFront(self)
            let windowController = NSWindowController(window: qrCodeWindow)
            windowController.window?.title = "QR Code"
            windowController.showWindow(self)
        } else {
            showErrorMessage()
        }
    }
    
    func showErrorMessage(with detailedMessage: String? = "maybe it's maybelline") {
        let alert = NSAlert()
        alert.messageText = "Error while drawing QR code"
        alert.alertStyle = .warning
        alert.informativeText = detailedMessage!
        alert.runModal()
    }

}
