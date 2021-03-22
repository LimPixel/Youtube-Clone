//
//  Constants.swift
//  Youtube Clone
//
//  Created by Abdul Halim on 15/03/21.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyAVpl2CugmYOTgybzFFeh2zIPnJZbZJ6fo"
    static var PLAYLIST_ID = "PLL32ppwoZBYLxol9-8cLD2sFMdRLsHCGb"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(PLAYLIST_ID)&key=\(API_KEY)"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
    
    static var VIDEOCELL_ID = "VideoCell"
}
