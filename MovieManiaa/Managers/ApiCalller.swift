//
//  ApiCalller.swift
//  netflixClone
//
//  Created by Waseem Ali on 19/11/2022.
//

import Foundation




struct constant {
    static let API_kEY = "2bd360f927a0cc6ebbdf4b0a1ed86d82";
    static let baseUrl = "https://api.themoviedb.org"
}

class ApiCaller {
    
    static let shared = ApiCaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie],Error>)->Void)  {
       
        guard let url  = URL(string: "\(constant.baseUrl)/3/trending/movie/day?api_key=\(constant.API_kEY)") else {return}
       
        dataTask(url: url, completion: completion)
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Movie],Error>)->Void)  {
       
        guard let url  = URL(string: "\(constant.baseUrl)/3/trending/tv/day?api_key=\(constant.API_kEY)") else {return}
       
        dataTask(url: url, completion: completion)
                
    }
    
    func getPopular(completion: @escaping (Result<[Movie],Error>)->Void)  {
       
        guard let url  = URL(string: "\(constant.baseUrl)/3/movie/popular?api_key=\(constant.API_kEY)") else {return}
       
        dataTask(url: url, completion: completion)
    }
    
    func getTopRated(completion: @escaping (Result<[Movie],Error>)->Void)  {
       
        guard let url  = URL(string: "\(constant.baseUrl)/3/movie/top_rated?api_key=\(constant.API_kEY)") else {return}
       
        dataTask(url: url, completion: completion)
    }
    func getUpcoming(completion: @escaping (Result<[Movie],Error>)->Void)  {
       
        guard let url  = URL(string: "\(constant.baseUrl)/3/movie/upcoming?api_key=\(constant.API_kEY)") else {return}
       
        dataTask(url: url, completion: completion)
    }
    
    
    func dataTask(url:URL,completion: @escaping (Result<[Movie],Error>)->Void) {
        
        print("creating task")
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _,error in
            print("inside task handller")
            guard  let data = data ,error == nil else{
                return
                
            }
            do{
                print(data)
                print("serializain data")
//                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let result = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
//                print(result)
                let arr  = "waseem"
                completion(.success(result.results ?? []) )
                
            }catch{
                completion(.failure(error))
            }
            
        }
        print("resuming task")
        task.resume()
        print("end of function")
        
    }
    
    
}
