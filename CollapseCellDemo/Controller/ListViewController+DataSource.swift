//
//  ViewController+DataSource.swift
//  CollapseCellDemo
//
//  Created by Deepu Mishra on 18/03/21.
//

import UIKit
import Foundation

extension ListViewController {
    func configureTableView() {
      registerTableViewCell()
    }
    private func registerTableViewCell() {
        tblListView.registerCell(SubCategoryViewCell.identifire)
        tblListView.registerCell(CategoryViewCell.identifire)
        tblListView.delegate = self
        tblListView.dataSource = self
        tblListView.estimatedRowHeight = 100
        tblListView.rowHeight = UITableView.automaticDimension
        tblListView.estimatedSectionHeaderHeight = 60
        tblListView.sectionHeaderHeight = UITableView.automaticDimension
    }
}
// Table view data source
extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return list?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.hiddenSections.contains(section) {
            return list?[section].subCategory?.count ?? 0
        } else {
          return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureCell(indexPath)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: CategoryViewCell.identifire)
            as? CategoryViewCell {
            let model = list?[section]
            cell.btnCategory.tag = section
            cell.delegate = self
            cell.categoryModelData = model
            if self.hiddenSections.contains(section) {
               cell.imgDownArrow.image = #imageLiteral(resourceName: "upArrowIcon")
            } else {
                cell.imgDownArrow.image = #imageLiteral(resourceName: "downArrowIcon")
            }
          return cell
        }
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
       return CGFloat.leastNormalMagnitude
    }
    private func configureCell(_ indexPath: IndexPath) -> UITableViewCell {
        if let cell = tblListView.dequeueReusableCell(
            withIdentifier: SubCategoryViewCell.identifire, for: indexPath) as? SubCategoryViewCell {
            let section  = indexPath.section
            let index = indexPath.row
            let model = list?[section].subCategory?[index]
            cell.subCategoryModelData = model
            return cell
        } else { return UITableViewCell()}
    }
}
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
