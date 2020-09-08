//
//  AvPlayerView.swift
//  Courses
//
//  Created by George kapoya on 16.5.2020.
//  Copyright © 2020 George kapoya. All rights reserved.
//

import SwiftUI
import AVKit

struct AvPlayerView: UIViewControllerRepresentable {

    let videoUrl: URL?

    private var player: AVPlayer {
        return AVPlayer(url: videoUrl!)
    }


    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
        playerController.modalPresentationStyle = .automatic
        playerController.player = player
        playerController.player?.play()
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        return AVPlayerViewController()
    }

}

