//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Dnyaneshwar on 09/01/21.
//

import UIKit
 
@objc protocol DASongsListViewControllerDelegateHandler: class {
    @objc optional func reloadTableView()
}

class DASongsListViewController: UIViewController {
    private  var viewModel = DASongsListViewModel()
    @IBOutlet weak private var tableView: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserInterface()
    }
}

extension DASongsListViewController {
    func setUserInterface() {
        setData()
        setComponent()
        registerTableViewCells()
    }
    
    private func setComponent() {
        tableView.setTableView(tableView: tableView, dataSourceDelegate: self)
        viewModel.delegate = self
    }
    
    private func registerTableViewCells() {
        tableView.registerNibForCell(DAAlbumTableCell.self)
    }
}

extension DASongsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albumArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowModel = viewModel.albumArray[indexPath.row]
        guard let cell: DAAlbumTableCell = tableView.dequeueReusableCellForIndexPath(indexPath) else {return UITableViewCell()}
        cell.setConfigureData(rowModel: rowModel)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowModel = viewModel.albumArray[indexPath.row]
        print(rowModel.title)
        print(rowModel.audioURL)
        
        let vc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        vc?.songUrl = rowModel.audioURL
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
     
}

extension DASongsListViewController {
    func setData() {
        viewModel.setModelData()
    }
}

extension DASongsListViewController: DASongsListViewControllerDelegateHandler {
    func reloadTableView() {
        print(viewModel.albumArray)
    }
}
