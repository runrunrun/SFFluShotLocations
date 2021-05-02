//
//  FluShotLocationDataService.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 4/4/21.
//

import Foundation

final class FluShotLocationDataService {
    private let locationsURL = URL(string: "https://data.sfgov.org/resource/yg87-cd6v.json")!

    func fetchLocations(_ completion: @escaping ([FluAppointment]?, Error?) -> Void) {
        URLSession.shared.dataTask(with: locationsURL) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.sync {
                    completion(nil, error)
                }
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let locations =  try decoder.decode([FluAppointment].self, from: data)
                DispatchQueue.main.sync {
                    completion(locations, nil)
                }
            } catch let error {
                DispatchQueue.main.sync {
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
