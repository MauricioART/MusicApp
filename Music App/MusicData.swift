//
//  MusicData.swift
//  Music App
//
//  Created by Diplomado on 23/11/24.
//

import UIKit


struct Song{
    var name: String
    var duration: Int
}

struct Album{
    var coverImage: UIImage
    var name: String
    var songs: [Song]
    
}

struct Band{
    var name: String
    var albums: [Album]
    
    init(name: String, albums: [Album]) {
        self.name = name
        self.albums = albums
    }
    
    init(name: String){
        self.name = name
        self.albums = []
    }
}

struct MusicDB {
    var bands : [Band] = []
    
    func getAlbums(bandName: String)->[Album]{
        if let band = self.bands.first(where: { $0.name == bandName}){
            return band.albums
        }else{
            return []
        }
    }
    
    func getBandNames()->[String]{
        return self.bands.map({$0.name})
    }
    
    mutating func addBand(bandName: String) -> Bool{
        if self.bands.contains(where: {$0.name == bandName}){
            return false
        }
        else{
            self.bands.append(Band(name: bandName))
            return true
        }
    }
    
    mutating func addAlbum(bandName: String, albumName: String, songsList: [Song])->Bool{
        if var band = self.bands.first(where: {$0.name == bandName}){
            var newAlbum: Album = Album(coverImage: UIImage.cover2, name: albumName, songs: songsList)
            band.albums.append(newAlbum)
            return true
        }
        else {
            return false
        }
    }
    
// Método para cargar los datos de música de ejemplo
    mutating func loadSampleMusicData() {
        // Crear canciones
        let maroon5Songs1 = [
            Song(name: "This Love", duration: 206),
            Song(name: "She Will Be Loved", duration: 258),
            Song(name: "Harder to Breathe", duration: 173)
        ]
        
        let maroon5Songs2 = [
            Song(name: "Payphone", duration: 231),
            Song(name: "One More Night", duration: 220),
            Song(name: "Moves Like Jagger", duration: 201)
        ]
        
        let maroon5Songs3 = [
            Song(name: "Sugar", duration: 235),
            Song(name: "Maps", duration: 194),
            Song(name: "Animals", duration: 230)
        ]
        
        // Crear álbumes
        let maroon5Albums = [
            Album(coverImage: UIImage(named: "songs_about_jane_cover") ?? UIImage(), name: "Songs About Jane", songs: maroon5Songs1),
            Album(coverImage: UIImage(named: "overexposed_cover") ?? UIImage(), name: "Overexposed", songs: maroon5Songs2),
            Album(coverImage: UIImage(named: "v_cover") ?? UIImage(), name: "V", songs: maroon5Songs3)
        ]
        
        let coldplaySongs1 = [
            Song(name: "Yellow", duration: 269),
            Song(name: "Shiver", duration: 299),
            Song(name: "Trouble", duration: 269)
        ]
        
        let coldplaySongs2 = [
            Song(name: "Clocks", duration: 307),
            Song(name: "The Scientist", duration: 309),
            Song(name: "In My Place", duration: 229)
        ]
        
        let coldplaySongs3 = [
            Song(name: "Magic", duration: 285),
            Song(name: "A Sky Full of Stars", duration: 268),
            Song(name: "Ink", duration: 227)
        ]
        
        // Crear álbumes
        let coldplayAlbums = [
            Album(coverImage: UIImage(named: "parachutes_cover") ?? UIImage(), name: "Parachutes", songs: coldplaySongs1),
            Album(coverImage: UIImage(named: "rush_of_blood_cover") ?? UIImage(), name: "A Rush of Blood to the Head", songs: coldplaySongs2),
            Album(coverImage: UIImage(named: "ghost_stories_cover") ?? UIImage(), name: "Ghost Stories", songs: coldplaySongs3)
        ]
        
        // Crear bandas y agregar álbumes
        let maroon5 = Band(name: "Maroon 5", albums: maroon5Albums)
        let coldplay = Band(name: "Coldplay", albums: coldplayAlbums)
        
        // Agregar las bandas a la base de datos
        self.bands = [maroon5, coldplay]
    }
    
}


var musicData = MusicDB()


