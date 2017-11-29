//
//  EventService.swift
//  NavigationForiOS
//
//  Created by ともひろ on 2017/08/17.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum ResponseStatus{
    case Success
    case NotFound
    case DontMatchEventId
}

class EventService {
    /// イベントの名前を取得
    ///
    /// - Returns: イベントを含む配列
    func getEvents(responseEvents: @escaping ([String]) -> Void){
        Alamofire.request("https://gist.githubusercontent.com/ferretdayo/b5743089f2d5f5468cca58ed9cf96b81/raw/2a6b2ca3937a61ab5b3a01ee30ecddb28103e41b/eventList.json")
        .responseJSON { response in
            var events: [String] = []
            switch response.result {
            case .success(let response):
                let eventJson = JSON(response)
                eventJson["events"].forEach{(_, data) in
                    events.append(data.string!)
                }
                break
            case .failure(let error):
                SlackService.postError(error: error.localizedDescription, tag: "Event Service")
                break
            }
            responseEvents(events)
        }
    }
    
    
    /// 指定されたイベントIDを検索し，あればイベント情報を取得する．
    ///
    /// - Parameter responseEvents: イベント情報
    func searchEvents(eventIdInputFormText: String, responseEvents: @escaping (EventEntity?, ResponseStatus) -> Void){
        Alamofire.request("\(Const().URL_API)/events/\(eventIdInputFormText)")
            .responseJSON { response in
                var events: EventEntity? = nil
                var responseStatus: ResponseStatus = ResponseStatus.Success
                switch response.result {
                case .success(let response):
                    let eventJson = JSON(response)
                    if eventJson["status"].int! != 200 {
                        SlackService.postError(error: "イベントがありません", tag: "Event Service")
                        responseStatus = ResponseStatus.NotFound
                        break;
                    }
                    let data = eventJson["data"]
                    if data["id"].string != eventIdInputFormText {
                        responseStatus = ResponseStatus.DontMatchEventId
                    } else {
                        let formatter = DateFormatter()
                        formatter.timeZone = NSTimeZone(name: "GMT")! as TimeZone!
                        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                        events = EventEntity(id: data["id"].string!, name: data["name"].string!, info: data["description"].string!, startDate: formatter.string(from: Date(timeIntervalSince1970: TimeInterval(data["startDate"].int!)/1000)), endDate: formatter.string(from: Date(timeIntervalSince1970: TimeInterval(data["endDate"].int!)/1000)), location: data["location"].string!)
                        responseStatus = ResponseStatus.Success
                    }
                    break
                case .failure(let error):
                    SlackService.postError(error: error.localizedDescription, tag: "Event Service")
                    break
                }
                responseEvents(events, responseStatus)
        }
    }
}
