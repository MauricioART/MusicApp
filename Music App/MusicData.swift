//
//  MusicData.swift
//  Music App
//
//  Created by Diplomado on 23/11/24.
//

import Foundation

// Definir las bandas y sus álbumes con canciones
var music: [[String: Any]] = [
    [
        "nombre": "Maroon 5",
        "álbumes": [
            [
                "nombre": "Songs About Jane",
                "canciones": ["This Love", "She Will Be Loved", "Harder to Breathe"]
            ],
            [
                "nombre": "Overexposed",
                "canciones": ["Payphone", "One More Night", "Moves Like Jagger"]
            ],
            [
                "nombre": "V",
                "canciones": ["Sugar", "Maps", "Animals"]
            ]
        ]
    ],
    [
        "nombre": "Coldplay",
        "álbumes": [
            [
                "nombre": "Parachutes",
                "canciones": ["Yellow", "Shiver", "Trouble"]
            ],
            [
                "nombre": "A Rush of Blood to the Head",
                "canciones": ["Clocks", "The Scientist", "In My Place"]
            ],
            [
                "nombre": "Ghost Stories",
                "canciones": ["Magic", "A Sky Full of Stars", "Ink"]
            ]
        ]
    ],
    [
        "nombre": "The Strokes",
        "álbumes": [
            [
                "nombre": "Is This It",
                "canciones": ["Last Nite", "Hard to Explain", "Someday"]
            ],
            [
                "nombre": "Room on Fire",
                "canciones": ["Reptilia", "12:51", "Under Control"]
            ],
            [
                "nombre": "First Impressions of Earth",
                "canciones": ["Juicebox", "Heart in a Cage", "Machu Picchu"]
            ]
        ]
    ],
    [
        "nombre": "Muse",
        "álbumes": [
            [
                "nombre": "Absolution",
                "canciones": ["Time Is on My Side", "Hysteria", "Stockholm Syndrome"]
            ],
            [
                "nombre": "Black Holes and Revelations",
                "canciones": ["Supermassive Black Hole", "Knights of Cydonia", "Starlight"]
            ],
            [
                "nombre": "The Resistance",
                "canciones": ["Uprising", "Undisclosed Desires", "Resistance"]
            ]
        ]
    ],
    [
        "nombre": "The Killers",
        "álbumes": [
            [
                "nombre": "Hot Fuss",
                "canciones": ["Mr. Brightside", "Somebody Told Me", "Smile Like You Mean It"]
            ],
            [
                "nombre": "Sam's Town",
                "canciones": ["When You Were Young", "Bones", "Read My Mind"]
            ],
            [
                "nombre": "Day & Age",
                "canciones": ["Human", "Spaceman", "A Dustland Fairytale"]
            ]
        ]
    ]
]

struct Music {
    var bands: [Band] = []
    init(data: [[String: Any]]) {
        for band in data {
            if let nombreBanda = band["nombre"] as? String, let albums = band["álbumes"] as? [[String: Any]] {
                bands.append(Band(name: nombreBanda, albums: albums))
            }
        }
    }
    

}

struct Band{
    var name: String
    var albums: [Album] = []
    init(name: String, albums: [[String: Any]]) {
        self.name = name
        for album in albums {
            if let nombreAlbum = album["nombre"] as? String, let canciones = album["canciones"] as? [String] {
                self.albums.append(Album(title: nombreAlbum, songs: canciones))
            }
        }
    }
}

struct Album{
    var title: String
    var songs: [String]
    init(title: String, songs: [String]) {
        self.title = title
        self.songs = songs
    }
}

struct MusicDB {
    var bands: [String]
    var albums: [String:[String:[String]]]
    
    func getAlbumsName(band: String) -> [String]?{
        if bands.contains(band){
            var albumNames = []
            for album in albums[band]{
                
            }
        }else{
            return nil
        }
    }
    
    
    mutating func addAlbum(band: String, albumName: String, playList: [String]) -> Bool {
        if bands.contains(band){
            albums[band]? = [albumName:playList]
            return true
        }else{
            return false
        }
    }
    
    
    mutating func addBand(name: String){
        bands.append(name)
        albums[name] = [:]
    }
}
var musicData = Music(data: music)
