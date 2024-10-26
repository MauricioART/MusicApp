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
    @IBOutlet weak var slider: UISlider!
    
    var musicList: [SongModel] = []
    var playButtonState: PlayButtonState = .pause
    var currentSongIndex: Int = 1
    var timer: Timer?
    var currentTimeValue: TimeInterval = 0
    var isPlaying = false

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
                pauseSong()
            case .pause:
                playSong()
                
            }
        case "backButton":
            backSong()
        case "forwardButton":
            forwardSong()
        default:
            print("Default")
        }
    }
    
    
    private func playSong() {
        let currentSong = musicList[currentSongIndex]
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        playButton.setTitle("Pause", for: .normal)
        playButtonState = .play
        isPlaying = true
        startProgress(for: TimeInterval(currentSong.duration)) // Inicia el temporizador
    }

    private func pauseSong() {
        self.timer?.invalidate()
        isPlaying = false
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.setTitle("Play", for: .normal)
        playButtonState = .pause
        
    }
    
    private func forwardSong(){
        self.timer?.invalidate()
        currentTimeValue = 0
        if (currentSongIndex == musicList.count - 1){
            currentSongIndex = 0
        }else{
            currentSongIndex  = currentSongIndex + 1
        }
        currentTime.text = "0:00"
        updateCurrentSongInfo()
        playSong()
    }
    
    private func backSong(){
        self.timer?.invalidate()
        currentTimeValue = 0
        if currentSongIndex == 0 {
            currentSongIndex = musicList.count - 1
        }else{
            currentSongIndex = currentSongIndex - 1
        }
        currentTime.text = "0:00"
        updateCurrentSongInfo()
        playSong()
    }

    private func startProgress(for duration: TimeInterval) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if (isPlaying){
                self.currentTimeValue += 1 // Incrementa el tiempo actual
                let progress = Float(self.currentTimeValue / duration)
                self.progressBar.setProgress(progress, animated: true)
                
                // Actualiza el tiempo actual
                let minutes = Int(self.currentTimeValue) / 60
                let seconds = Int(self.currentTimeValue) % 60
                self.currentTime.text = String(format: "%d:%02d", minutes, seconds)
                
                // Detener el temporizador cuando simula el fin de la canción
                if self.currentTimeValue >= duration {
                    self.timer?.invalidate()
                    forwardSong()
                    
                }
            }
        }
    }
        
    
    private func updateCurrentSongInfo(){
    
        progressBar.progress = 0
        let currentSong = musicList[self.currentSongIndex]
        songTitle.text = currentSong.artist + " - " + currentSong.name
        let minutes = Int(currentSong.duration) / 60
        let seconds = Int(currentSong.duration) % 60
        self.durationTime.text = String(format: "%d:%02d", minutes, seconds)
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
