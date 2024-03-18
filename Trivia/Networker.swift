//
//  Networker.swift
//  Trivia
//
//  Created by Thu nguyen on 3/15/24.
//

import Foundation
class Networker {
    func getQuestions(completion: @escaping(JSONQuestion?, Error?) -> Void){
        let url = URL(string: "https://opentdb.com/api.php?amount=5&type=multiple")!
        let task = URLSession.shared.dataTask(with: url){
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error{
                print("error", error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else{
                print ("Not the right response")
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print ("Error, status code", httpResponse.statusCode)
                return
            }
            
            guard let data = data else {
                print ("bad data")
                return
            }
            
            do{
                let json = try JSONDecoder().decode(JSONQuestion.self, from: data)
                DispatchQueue.main.async{
                    completion(json, nil)
                }
            } catch let error {
                print("Error", error)
            }
        }
        task.resume()
    }
}
