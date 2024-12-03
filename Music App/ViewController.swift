//
//  ViewController.swift
//  Music App
//
//  Created by Diplomado on 22/10/24.
//

import UIKit

class ViewController: UIViewController {

    var dataSource: UITableViewDiffableDataSource<Int,String>?
    @IBOutlet weak var tableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicData.loadSampleMusicData()
        setDataSource()
        setSnapshot()
        tableView.delegate = self
        
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
        snapshot.appendItems(musicData.bands.map({$0.name}))
        dataSource?.apply(snapshot)
    }
}


extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumsViewController = AlbumsViewController(nibName: nil, bundle: nil)
        albumsViewController.band = musicData.bands[indexPath.row]
        albumsViewController.modalPresentationStyle = .fullScreen
        present(albumsViewController, animated: true, completion: nil)
    }
    

}

