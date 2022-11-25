//
//  WebService.swift
//  AsyncCarData
//
//  Created by 진태영 on 2022/11/22.
//

import Foundation

class WebService{
    
    func fetchData(url: String) async throws -> [Car]{

        guard let url = URL(string: url) else { return [] }

        let (data, _) = try await URLSession.shared.data(from: url)

        let cars = try JSONDecoder().decode([Car].self, from: data)

        return cars
    }
}
