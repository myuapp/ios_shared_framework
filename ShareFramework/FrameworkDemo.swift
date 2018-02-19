//
//  FrameworkDemo.swift
//  FrameworkDemo
//
//  Created by Hausala Vishwakarma on 13/02/18.
//  Copyright © 2018 Hausala Vishwakarma. All rights reserved.
//

import UIKit

import Alamofire


open class ShareFramework: NSObject {
    
    //*******************************************************
    // MARK: -  Property
    // MARK: -
    //*******************************************************
    
    public typealias CompletionHandler = (_ result: AnyObject?, _ error: Swift.Error?) -> Void
    
    //*******************************************************
    // MARK: -   uploadData Data using URl
    // MARK: -
    //*******************************************************
    
    open static func uploadUsingUrl(dataPath:URL,
                                    name:String,
                                    fileName:String?,
                                    to:String,
                                    mimeType:String?,
                                    completion: @escaping CompletionHandler){

        
        API.uploadData(dataPath: dataPath, name: name, fileName: fileName ?? nil, to: to, mimeType: mimeType ?? nil, completion: { (results, error) in
            
            completion(results,error)
            
        })
    }
    
   
    
    //*******************************************************
    // MARK: -   uploadData Data using NSData
    // MARK: -
    //*******************************************************
    
    open static func uploadUsingData(data:Data,
                                     name:String,
                                     fileName:String?,
                                     mimeType:String?,
                                     to:String,
                                     completion: @escaping CompletionHandler) {
       
        API.uploadData(data: data, name: name, fileName: fileName ?? nil, mimeType: (mimeType ?? nil)!, to: to, completion:{(results, error) in
            
            completion(results,error)
            
        })
        
    }
    
    
    
    //*******************************************************
    // MARK: -   uploadData Data using NSData
    // MARK: -
    //*******************************************************
    
    open static func uploadUsingStream(stream:InputStream,
                                       withLenth:UInt64,
                                       to:String,
                                       headers:HTTPHeaders?,
                                       name:String?,
                                       fileName:String?,
                                       mimeType:String?,
                                       completion: @escaping CompletionHandler)  {
        
        API.uploadData(stream: stream, withLenth: withLenth, to: to, headers: headers ?? nil, name: name ?? nil, fileName: fileName ?? nil, mimeType: mimeType ?? nil, completion: {(results, error) in
            
            completion(results,error)
            
        })
        
    }
    
    
    
}

