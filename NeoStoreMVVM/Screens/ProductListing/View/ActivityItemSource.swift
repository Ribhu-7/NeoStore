//
//  ActivityItemSource.swift
//  NeoStoreMVVM
//
//  Created by Apple on 30/07/24.
//

import Foundation
import UIKit
import LinkPresentation

class ItemDetailSource: NSObject {
    let name: String
    let image: UIImage

    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}

extension ItemDetailSource: UIActivityItemSource {

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        image
    }
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        image
    }

    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let metaData = LPLinkMetadata()
        metaData.title = name
        metaData.imageProvider = NSItemProvider(object: image)
        return metaData
    }
}
