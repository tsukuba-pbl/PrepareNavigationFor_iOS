//
//  SpeechService.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/09/20.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import AVFoundation

class SpeechService : NSObject, AVSpeechSynthesizerDelegate{
    let talker = AVSpeechSynthesizer()
    var audioPlayerInstance : AVAudioPlayer! = nil  // 再生するサウンドのインスタンス
    
    override init() {
        // サウンドファイルのパスを生成
        let soundFilePath = Bundle.main.path(forResource: "se1", ofType: "wav")!
        let sound:URL = URL(fileURLWithPath: soundFilePath)
        // AVAudioPlayerのインスタンスを作成
        do {
            audioPlayerInstance = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
        } catch {
            SlackService.postError(error: "AVAudioPlayerインスタンス作成失敗", tag: "SpeechService")
        }
        // バッファに保持していつでも再生できるようにする
        audioPlayerInstance.prepareToPlay()
    }
    
    func announce(str: String){
        //効果音
        audioPlayerInstance.play()
        //アナウンス内容
        textToSpeech(str: str)
    }
    
    func textToSpeech(str : String){
        let utterance = AVSpeechUtterance(string: str)//読み上げる文字
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")//読み上げの言語
        utterance.rate = 0.6 //読み上げの速度
        utterance.pitchMultiplier = 1.2 //声の高さ
        utterance.preUtteranceDelay = 1 //読み上げまでの待機時間
        utterance.postUtteranceDelay = 0 //読んだあとの待機時間
        talker.delegate = self
        talker.speak(utterance) //発話
    }

}
