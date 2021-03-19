//
//  SubCategoryViewCell.swift
//  CollapseCellDemo
//
//  Created by Deepu Mishra on 19/03/21.
//

import UIKit

class SubCategoryViewCell: UITableViewCell, Identifiable {
    @IBOutlet weak var lblDisplayText: UILabel!
    @IBOutlet weak var lblSubCategoryName: UILabel!
    var subCategoryModelData: SubCategory? {
        didSet {
          setData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    private func setData() {
        lblSubCategoryName.text = subCategoryModelData?.name?.capitalizingFirstLetter()
        lblDisplayText.text = subCategoryModelData?.displayName ?? ""
    }
}
