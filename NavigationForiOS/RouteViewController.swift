//
//  RouteViewController.swift
//  NavigationForiOS
//
//  Created by ともひろ on 2017/08/16.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import UIKit
import Eureka

class RouteViewController: FormViewController {
    
    var point: [String] = []
    var source: String = ""
    var destination: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // API的に対象の地点を取得し，Formの選択データにセット
        LocationService.getLocations{ responseLocations in
            self.point = responseLocations
            
            if let LocationsRow = self.form.rowBy(tag: "SourceLocations") {
                LocationsRow.updateCell()
            }
            
            if let LocationsRow = self.form.rowBy(tag: "DestinationLocations") {
                LocationsRow.updateCell()
            }
        }
            
        form
        +++ Section("作成するナビゲーションルートの出発地と目的地を選択してください")
            
        +++ Section("出発地")
            <<< PushRow<String>("SourceLocations"){
                $0.title = "現在地"
                $0.selectorTitle = "現在地の選択"
                $0.options = self.point
                $0.onChange{[unowned self] row in
                    self.source = row.value ?? self.point[0]
                }
            }.cellUpdate { cell, row in
                row.options = self.point
            }
            
                    
        +++ Section("目的地")
            <<< PushRow<String>("DestinationLocations"){
                $0.title = "目的地"
                $0.selectorTitle = "目的地の選択"
                $0.options = self.point
                $0.onChange{[unowned self] row in
                    self.destination = row.value ?? self.point[0]
                }
            }.cellUpdate { cell, row in
                row.options = self.point
            }
        
            // Button
        +++ Section()
            <<< ButtonRow(){
                $0.title = "ナビゲーションデータの作成を開始"
                $0.onCellSelection{ [unowned self] cell, row in
                    if self.isSuccessLocationInput(source: self.source, destination: self.destination) {
                        //次のビュー(NavigationViewController)用にスタート地点と目的地の値を保持する
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.departure = self.source
                        appDelegate.destination = self.destination
                        let next = self.storyboard!.instantiateViewController(withIdentifier: "StartRouteCreateStoryboard")
                        self.present(next,animated: true, completion: nil)
                    }
                }
            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// 入力された場所が正しい入力かどうかの判定を行う関数
    ///
    /// - Parameters:
    ///   - source: 現在地の場所
    ///   - destination: 目的地の場所
    /// - Returns: 入力が正しければtrue，正しくなければfalse
    func isSuccessLocationInput(source: String, destination: String) -> Bool {
        var success: Bool = true
        if source == "" || destination == "" {
            self.makeAlert(title: "Error", message: "現在地または目的地に場所を入れてください")
            success = false
        } else if source == destination {
            self.makeAlert(title: "Error", message: "現在地と目的地は異なる場所を入れてください")
            success = false
        }
        return success
    }
    
    
    /// アラートを作る関数
    ///
    /// - Parameters:
    ///   - title: アラートのタイトル
    ///   - message: アラートのメッセージ
    func makeAlert(title: String, message: String) -> Void {
        // アラートを作成
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        // アラートにボタンをつける
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        // アラート表示
        self.present(alert, animated: true, completion: nil)
    }
}

