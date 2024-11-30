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
    
    var albumsData: [String: Any] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        bandLabel.text = albumsData["nombre"] as? String
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
//        var albums : [String] = []
//        for album in albumsData{
//            if let nombre = album["nombre"] as? String,
//                   let canciones = album["canciones"] as? [String] {
//                    
//                    // Imprimimos el nombre del álbum
//                    print("Álbum: \(nombre)")
//                    
//                    // Iteramos sobre las canciones de este álbum
//                    for canción in canciones {
//                        print("  Canción: \(canción)")
//                    }
//                }
//        }
        snapshot.appendItems([])
        dataSource?.apply(snapshot)
    }
}

extension AlbumsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // var songsViewController = SongsViewController(nibName: nil, bundle: nil)
        ///*songsViewController*/.albums = musicData[indexPath.row]
        
    }
    

}
