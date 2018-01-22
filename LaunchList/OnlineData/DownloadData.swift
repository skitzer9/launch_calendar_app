//
//  DownloadData.swift
//  LaunchList
//
//  Created by Jonathan Serrano Otero on 1/21/18.
//  Copyright © 2018 shaggy. All rights reserved.
//

import Foundation



struct DownloadPacket {
    let data: Data?
    let error: DownloadError!
}

enum DownloadError: Error {
    case BadURLFormat
    case ResponseCode
    case Unknown
    case Other(Error)
    case None
}

enum QueryFilter {
    case None
    case Filtered
}

enum LaunchQuery {
    case Agency
    case AgenyType
    case Calendar
    case EventType
    case Launch
    case LaunchEvent
    case LaunchProvider
    case LaunchStatus
    case Location
    case Mission
    case MissionEvent
    case MissionType
    case None
    case Pad
    case Rocket
    case RocketEvent
    case RocketFamily
}

enum QueryMode {
    case list
    case summary
    case verbose
}

protocol DownloadDataDelegate {
    func didReceiveData(packet: DownloadPacket) -> Void;
}

class DownloadData: NSObject {
    /** Launch API version */
    private let apiVersion: String = "1.3";
    
    /** URL session manager properties */
    private let defaultSession = URLSession(configuration: .default);
    private var dataTask: URLSessionDataTask?
    
    /** Delegate property*/
    var delegate: DownloadDataDelegate?;
    
    /** Query filtering variables */
    public var queryType: LaunchQuery!
    public var filterQuery: QueryFilter!
    public var queryMode: QueryMode = .list
    
    /** Raw and processed data variables */
    private(set) var stringData: String?
    private(set) var rawData: Data?
    private(set) var downloadError: DownloadError!;
    
    
//MARK: Initializers
    override init() {
        dataTask = nil;
    }
    
    init(dbInfo: LaunchQuery) {
        super.init();
        queryType = dbInfo
        stringData = nil;
        rawData = nil
        delegate = nil;
        filterQuery = .None
        downloadError = .None
        NSLog("QueryType Selected: \(queryType)");
    }
    
//MARK: Downloader Methods
    func downloadData() -> Void {
        /** Cancel any previously running task */
        dataTask?.cancel();
        
        
        if var urlComponents = URLComponents(string: buildURL()) {
            guard let url = urlComponents.url else {return}
            NSLog("URL: \(url.absoluteString)");
            dataTask = defaultSession.dataTask(with: url) {
                data, response, error in
                defer {self.dataTask = nil}
                if error != nil {
                    NSLog("Could not download: \(error.debugDescription)");
                    
                } else if data != nil {
                    if let res = response as? HTTPURLResponse {
                        if res.statusCode == 200 {
                            self.rawData = data;
                            
                            if (self.delegate != nil) {
                                self.delegate?.didReceiveData(packet: DownloadPacket.init(data: data, error: self.downloadError));
                            }
                            
                            self.stringData = String(data: data!, encoding: String.Encoding.utf8);
                        } else {
                            NSLog("Status Code = \(res.statusCode)");
                        }
                    }
                    
                }
            }
            
            NSLog("Download starting...");
            dataTask?.resume();
        } else {
            NSLog("Could not generate URL");
        }
        
        
    }
    
//MARK: URL Builders
    func buildURL(filter: QueryFilter = .None) -> String {
        return buildMainURL(forInfo: queryType);
    }
    
    private func mainURL() -> String {
        return "https://launchlibrary.net/\(apiVersion)"
    }
    
    private func buildMainURL(forInfo: LaunchQuery) -> String {
        switch forInfo {
        case .Agency:
            return "\(mainURL())/agency";
        case .Calendar:
            return "\(mainURL())/launch?mode=\(queryMode)";
            
        default:
            return "NaN";
        }
    }
}
