//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Dnyaneshwar on 09/01/21.
//

import UIKit
import SDWebImage

class DAAlbumTableCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension DAAlbumTableCell {
    func setConfigureData(rowModel: AlbumRowModel) {
        titleLabel.text = rowModel.title
        imgView.sd_setImage(with: URL(string: rowModel.image), placeholderImage:UIImage(named: ""))
    }
}
