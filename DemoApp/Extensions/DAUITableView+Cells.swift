//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Dnyaneshwar on 09/01/21.
//

import UIKit

extension UITableView {
   final func registerNibForCell<T: UITableViewCell>(_ cell: T.Type) {
        let cellNib = UINib(nibName: T.className, bundle: nil)
        register(cellNib, forCellReuseIdentifier: T.className)
    }
    
    final func registerNibForHeaderFooterView<T: UITableViewHeaderFooterView>(_ view: T.Type) {
        let viewNib = UINib(nibName: T.className, bundle: nil)
        register(viewNib, forHeaderFooterViewReuseIdentifier: T.className)
    }

    final func dequeueReusableCellForIndexPath<T: UITableViewCell>(_ indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T
    }
    
    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? {
        return dequeueReusableHeaderFooterView(withIdentifier: T.className) as? T
    }
    
    final func setTableView(tableView: UITableView, dataSourceDelegate: UITableViewDataSource & UITableViewDelegate) {
        tableView.delegate = dataSourceDelegate
        tableView.dataSource = dataSourceDelegate
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 100
        tableView.removeStickyHeader(tableView: tableView)
    }
    
    final func removeStickyHeader(tableView: UITableView) {
        let tableHeaderHeight = CGFloat(55)
        let tableWidth = tableView.bounds.size.width
        let tableFrame = CGRect(x: 0, y: 0, width: tableWidth, height: tableHeaderHeight)
        tableView.tableHeaderView = UIView(frame: tableFrame)
        tableView.contentInset = UIEdgeInsets(top: -tableHeaderHeight, left: 0, bottom: 0, right: 0)
    }
}

