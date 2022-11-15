//
//  VideoView.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//

import UIKit
import AVFoundation

class VideoView: UIView{
    override class var layerClass: AnyClass{
        return AVPlayerLayer.self
    }
    var playerLayer: AVPlayerLayer{
        let layer = layer as! AVPlayerLayer
        layer.videoGravity = .resizeAspectFill
        return layer
    }
    var player: AVPlayer? {
        get{
            return playerLayer.player
        }
        set{
            playerLayer.player = newValue
        }
    }
    
}
