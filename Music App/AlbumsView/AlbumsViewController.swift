//
//  AlbumsViewController.swift
//  Music App
//
//  Created by Diplomado on 23/11/24.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var bandLabel : UILabel!
    var dataSource: UITableViewDiffableDataSource<Int,String>?
    
    var band: Band?

    override func viewDidLoad() {
        super.viewDidLoad()
        bandLabel.text = band?.name
        setDataSource()
        setSnapshot()
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
    }
    
    func setDataSource(){
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = itemIdentifier
            return cell
        })
    }

    func setSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<Int,String>()
        snapshot.appendSections([0])
        if let alumbs = band?.albums.map({$0.name}){
            snapshot.appendItems(alumbs)
        }
        dataSource?.apply(snapshot)
    }
}

extension AlbumsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var songsViewController = SongsViewController(nibName: nil, bundle: nil)
        songsViewController.album = band?.albums[indexPath.row]
        songsViewController.modalPresentationStyle = .fullScreen
        present(songsViewController, animated: true, completion: nil)
        
    }
    

}