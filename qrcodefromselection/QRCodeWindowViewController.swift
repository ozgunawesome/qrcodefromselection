//
//  QRCodeWindowController.swift
//  qrcodefromselection
//
//  Created by oz on 7/13/22.
//

import Cocoa

class QRCodeWindowViewController: NSViewController {

    @IBOutlet weak var qrCodeImageView: NSImageView!
    
    var qrString: String? = nil
    var codeDrawn: Bool = false

    override func viewWillAppear() {
        print("QRCode window will appear")
    }
    
    override func viewDidDisappear() {
        print("QRCode window will disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("QRCode window loaded")
        codeDrawn = generateQRCode()
    }
    
    func generateQRCode() -> Bool {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else {
            return false
        }
        
        filter.setValue(qrString?.data(using: .utf8), forKey: "inputMessage")
        filter.setValue("Q", forKey: "inputCorrectionLevel")

        guard let ciImage = filter.outputImage else {
            return false
        }
        
        let rep = NSCIImageRep(ciImage: ciImage)
        let image = NSImage(size: rep.size)
        image.addRepresentation(rep)
        
        let size = qrCodeImageView.frame.size
        let nsImage = NSImage(size: size)

        print("generated size = \(rep.size) frame size = \(size)")

        nsImage.lockFocus()
        NSGraphicsContext.current?.imageInterpolation = .none
        image.draw(in: NSRect(origin: .zero, size: size))
        nsImage.unlockFocus()

        qrCodeImageView.image = nsImage
        print("QR code drawn")
        return true
    }


}
