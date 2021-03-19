//
//  ListViewController.swift
//  CollapseCellDemo
//
//  Created by Deepu Mishra on 18/03/21.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tblListView: UITableView!
    var list: ListModelData?
    var hiddenSections = Set<Int>()
    var expandedCategory = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        intialViewSetUp()
    }
}
// Intial view set up methods
extension ListViewController: CategoryViewDelegate {
    func categoryTapHandler(_ section: Int) {
        if self.hiddenSections.contains(section) {
            self.hiddenSections.remove(section)
        } else {
            self.hiddenSections.insert(section)
        }
        tblListView.reloadData()
        //reloadSections(IndexSet(integer: section), with: .none)
    }
    private func intialViewSetUp() {
        list = JSONParserHelper.readLocalFile()
        configureTableView()
        tblListView.reloadData()
    }
}
