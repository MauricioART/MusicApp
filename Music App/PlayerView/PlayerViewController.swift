//
//  PlayerViewController.swift
//  Music App
//
//  Created by Diplomado on 22/10/24.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var durationTime: UILabel!
    @IBOutlet weak var albumArtwork: UIImageView!
    
    var musicList: [SongModel] = []
    var playButtonState: PlayButtonState = .pause
    var currentSongIndex: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeMusicList()
        updateCurrentSongInfo()
        
    }
    
    @IBAction func action(_ sender: UIButton){
        switch(sender.restorationIdentifier){
        case "playButton":
            switch(playButtonState){
            case .play:
                playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
                playButton.setTitle("Play ", for: .normal)
                playButtonState = .pause
            case .pause:
                playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                playButton.setTitle("Pause", for: .normal)
                playButtonState = .play
                
            }
        case "backButton":
            if currentSongIndex == 0 {
                currentSongIndex = musicList.count - 1
            }else{
                currentSongIndex = currentSongIndex - 1
            }
            updateCurrentSongInfo()
        case "forwardButton":
            if (currentSongIndex == musicList.count - 1){
                currentSongIndex = 0
            }else{
                currentSongIndex  = currentSongIndex + 1
            }
            updateCurrentSongInfo()
        default:
            print("Default")
        }
    }
    
    private func updateCurrentSongInfo(){
        
        progressBar.progress = 0
        let currentSong = musicList[self.currentSongIndex]
        songTitle.text = currentSong.artist + " - " + currentSong.name
        let minutes: String = currentSong.duration / 60 == 0 ? "0" : "\(currentSong.duration / 60 )"
        let seconds: String = currentSong.duration % 60 < 10 ? "0\(currentSong.duration % 60)" : "\(currentSong.duration % 60 )"
        currentTime.text = minutes + ":" + seconds
        albumArtwork.image = currentSong.coverImage
    }
    
    private func initializeMusicList(){
        musicList.append(SongModel(name: "Tranquilized", artist: "The Killers", duration: 225, coverImage: UIImage.cover1))
        musicList.append(SongModel(name: "Yellow", artist: "Coldplay", duration: 269, coverImage: UIImage.cover2))
        musicList.append(SongModel(name: "Bad Decisions", artist: "The Strokes", duration: 293, coverImage: UIImage.cover3))
    }
    
    
}

enum PlayButtonState{
    case play
    case pause
}
