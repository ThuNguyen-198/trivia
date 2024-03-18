////
////  File.swift
////  Trivia
////
////  Created by Thu nguyen on 3/14/24.
////
//
//import Foundation
//enum NetworkServiceError: Error {
//    case badResponse
//    case badStatusCode(Int)
//    case badData
//}
//
//class NetworkService {
//    func get question (completion : @escaping (Question?, Error?) -> Void){
//        let url = URL(string : "https://opentdb.com/api.php?amount=20&type=multiple")!
//        let task = URLSession.shared.dataTask(with: url){
//            (data: Data?, response: URLResponse?, error: Error?)in
//            if let error = error{
//                DispatchQueue.main.async{
//                    completion(nil, error)
//                }
//                return
//            }
//            guard let httpResponse = response as? HTTPURLResponse else {
//                DispatchQueue.main.async{
//                    completion(nil, NetworkServiceError.badResponse)
//                }
//                return
//            }
//            guard (200...299).contains(httpResponse.statusCode)else{
//                DispatchQueue.main.async{
//                    completion(nil, NetworkServiceError.badStatusCode(httpResponse.statusCode)
//                }
//                return
//            }
//           guard let data = data else{
//                        DispatchQueue.main.async{
//                            completion(nil, NetworkServiceError.badData)
//                        }
//                        return
//                    }
//                               do{
//                        let question = try JSONDecoder
//                    }
//        }
//    }
//}
