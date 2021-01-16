//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Dnyaneshwar on 09/01/21.
//

import Foundation

class DASongsListViewModel {
    weak var delegate: DASongsListViewControllerDelegateHandler?
    private var albumData = DAConfigManager.shared.configDetails
    var albumArray = [AlbumRowModel]()
    
    func setModelData() {
        guard let entryArray = albumData?.feed?.entry else { return }
        for item in entryArray {
            guard let title = item.title?.label,
                  let audioURL = item.link?.last?.attributes?.href,
                  let imageURL = item.imImage?.first?.label
            else { return }
            albumArray.append(AlbumRowModel(title: title, image: imageURL, audioURL: audioURL))
        }
        delegate?.reloadTableView?()
    }
}

struct AlbumRowModel {
    private(set) var title: String = ""
    private(set) var image: String = ""
    private(set) var audioURL: String = ""
        
    init(title: String = "", image: String = "", audioURL: String = "") {
        self.title = title
        self.image = image
        self.audioURL = audioURL
    }
}
