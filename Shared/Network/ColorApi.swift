//
//  ColorApi.swift
//  Palette
//
//  Created by yjlee12 on 2021/12/26.
//

import Foundation
enum APIError: Error {
    case invalidURL
    case decodeError
    case requestError
    case responseError
    case error(String)
    
    var message: String {
        switch self {
        case .invalidURL:
            return "유효하지 않은 검색어입니다.\n 다시 검색해주세요!"
        case .decodeError:
            return "모종의 이유로 불러오기를 실패했어요 ㅠㅠ"
        case .requestError:
            return "검색한 책이 없어요!"
        case .responseError:
            return "네트워크 상태가 안좋아요! ㅠㅠ"
        case let .error(msg):
            return msg
        }
    }
}


import Combine

class APIService {
    private let urlSession: URLSession
    let url = "https://www.thecolorapi.com/scheme?"
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    func getSearch() -> AnyPublisher<ColorPalette, Error> {
        guard let queryUrl = URL(string: url + "hex=0047AB") else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        return urlSession.dataTaskPublisher(for: queryUrl)
            .mapError { error in
                return error
            }
            .map(\.data)
            .mapError({ error  in
                return error
            })
            .decode(type: ColorPalette.self, decoder: JSONDecoder())
            .mapError({ error in
                return error
            })
            .eraseToAnyPublisher()
    }
}
