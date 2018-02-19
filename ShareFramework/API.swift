//
//let parameters = [
//    "file_name": "swift_file.jpeg"
//]
//for (key, value) in parameters {
//    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//}
//multipartFormData.append(videoUrl,
                         //withName: "profileVideo",
                         //fileName: "video.mp4",
                        // mimeType: "video/mp4")
//  API.swift
//  FrameworkDemo
//
//  Created by Hausala Vishwakarma on 15/02/18.
//  Copyright © 2018 Hausala Vishwakarma. All rights reserved.
//

import Foundation
import Alamofire



internal typealias CompletionHandler = (_ result: AnyObject?, _ error: Swift.Error?) -> Void

class API {
    
    //*******************************************************
    // MARK: - uploadData Data using URl
    // MARK: -
    //*******************************************************
    
   
    
      static func uploadData(dataPath:URL,
                       name:String ,
                       fileName:String?,
                       to:String,
                       mimeType:String?,
                       completion: @escaping CompletionHandler){
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
                 if fileName != nil && mimeType != nil{
                      multipartFormData.append(dataPath,withName: name,fileName: fileName!,mimeType: mimeType!)
                 }else{
                      multipartFormData.append(dataPath, withName: name)
                   
                 }
            
       }, to: to){ (result) in
                                        switch result {
                                        
                                              case .success(let upload, _, _):
                                                
                                                   upload.uploadProgress(closure: { (progress) in
                                                        completion(progress as AnyObject, nil)
                                                    })
                                                   
                                                   upload.responseJSON { response in
                                                        completion(response as AnyObject, nil)
                                                    
                                                   }
                
                                              case .failure(let encodingError):
                                            
                                                        completion(nil, encodingError)
                                        }
                  }
        
        
    }
    

    
    
    
    
    
    //*******************************************************
    // MARK: -uploadData Data using NSData
    // MARK: -
    //*******************************************************
    
    static func uploadData(data:Data,
                           name:String,
                           fileName:String?,
                           mimeType:String?,
                           to:String,
                           completion: @escaping CompletionHandler){
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            if fileName != nil && mimeType != nil {
                
                multipartFormData.append(data, withName: name, fileName: fileName!, mimeType: mimeType!)
                
            }else if mimeType != nil {
                
                multipartFormData.append(data, withName: name, mimeType: mimeType!)
                
            }else{
                
                multipartFormData.append(data, withName: name)
            }
        }, to: to){ (result) in
            
            switch result {
                
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    completion(progress as AnyObject, nil)
                    
                })
                
                upload.responseJSON { response in
                    completion(response as AnyObject, nil)
                    
                }
                
            case .failure(let encodingError):
                
                completion(nil, encodingError)
            }
            
            
        }
        
    }
    
    //*******************************************************
    // MARK: -uploadData Data using InputStream
    // MARK: -
    //*******************************************************
    
    static func uploadData(stream:InputStream,
                           withLenth:UInt64,
                           to:String,
                           headers:HTTPHeaders?,
                           name:String?,
                           fileName:String?,
                           mimeType:String?,
                           completion: @escaping CompletionHandler){
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            if headers != nil && name != nil && fileName != nil && mimeType != nil {
                
                multipartFormData.append(stream, withLength: withLenth, name: name!, fileName: fileName!, mimeType: mimeType!)
                
            }else if headers != nil {
                multipartFormData.append(stream, withLength: withLenth, headers: headers!)
            }
            
       
            
        }, to: to){ (result) in
            
            switch result {
                
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    completion(progress as AnyObject, nil)
                    
                })
                
                upload.responseJSON { response in
                    completion(response as AnyObject, nil)
                    
                }
                
            case .failure(let encodingError):
                
                completion(nil, encodingError)
            }
            
            
        }
        
    }
    
   
    
    



    
}
