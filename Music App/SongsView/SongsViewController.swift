//
//  SongsViewController.swift
//  Music App
//
//  Created by Diplomado on 23/11/24.
//

import UIKit

class SongsViewController: UIViewController {
    
    var dataSource: UITableViewDiffableDataSource<Int,String>?
    
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var album : Album?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SongTableViewCell", bundle: nil), forCellReuseIdentifier: "SongCell")
        albumLabel.text = album?.name
        setDataSource()
        setSnapshot()
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func setDataSource(){
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as? SongTableViewCell ?? SongTableViewCell(style: .default, reuseIdentifier: "SongCell")
                
                // Configura la celda
                // Asumiendo que 'itemIdentifier' tiene el tipo adecuado para tus datos, por ejemplo, un diccionario o una estructura
            cell.nameLabel.text = itemIdentifier // 'name' es una propiedad en tu modelo de datos
                cell.durationLabel.text = "duracion s"  // Asumiendo que 'duration' es un entero
                
//            cell.textLabel?.text = itemIdentifier
            return cell
        })
    }

    func setSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<Int,String>()
        snapshot.appendSections([0])
        if let songs = album?.songs.map({"\($0.name) \($0.duration)"}){
            snapshot.appendItems(songs)
        }
        dataSource?.apply(snapshot)
    }

}

extension SongsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
