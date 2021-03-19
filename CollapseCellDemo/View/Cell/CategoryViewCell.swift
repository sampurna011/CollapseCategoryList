//
//  CategoryViewCell.swift
//  CollapseCellDemo
//
//  Created by Deepu Mishra on 19/03/21.
//

import UIKit
protocol CategoryViewDelegate: class {
    func categoryTapHandler(_ section: Int)
}
class CategoryViewCell: UITableViewCell, Identifiable {
    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var imgDownArrow: UIImageView!
    @IBOutlet weak var btnCategory: UIButton!
    weak var delegate: CategoryViewDelegate?
    var categoryModelData: ListModel? {
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
        lblCategoryName.text = categoryModelData?.name?.capitalizingFirstLetter()
    }
    
    @IBAction func categoryDidTapHandler(_ sender: UIButton) {
        let tag = sender.tag
        delegate?.categoryTapHandler(tag)
    }
}
