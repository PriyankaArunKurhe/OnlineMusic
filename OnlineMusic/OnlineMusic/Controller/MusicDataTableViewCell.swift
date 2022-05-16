import UIKit
import AVFoundation
class MusicDataTableViewCell: UITableViewCell {
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var artistIdLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackIdLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    var playSongvar = false
    var preViewURL: String?
    var player:AVPlayer?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func playSongButon(){
        playSong()
    }
}
extension MusicDataTableViewCell {
    private func playSong () {
        let url = URL(string: self.preViewURL ?? "")
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer=AVPlayerLayer(player: player!)
        playerLayer.frame=CGRect(x:0, y:0, width:10, height:50)
        if playSongvar {
            playButton.setTitle("Play", for: .normal)
            playSongvar = false
            player?.pause()
        } else {
            playButton.setTitle("Pause", for: .normal)
            
            playSongvar = true
            player?.play()
        }
        
    }
    
}
