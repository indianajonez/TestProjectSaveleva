//
//  NetworkService.swift
//  TestProjectSaveleva
//
//  Created by Ekaterina Saveleva on 30.01.2024.
//
import Apollo
import Foundation
import Pomosch

extension Optional {
    var apolloNullable: GraphQLNullable<Wrapped> {
        switch self {
        case .some(let value):
            return .some(value)
        case .none:
            return .none
        }
    }
}

final class NetworkService {
    
    static let shared = NetworkService()
    
    private let apollo = ApolloClient(url: URL(string: "https://api.pomosch.app/graphql")!)
    
    private init() {}
    
    func fetchWards(first: Int, after: String?, order: [WardSortInput], completion: @escaping (String?, [Ward]) -> Void) {
        let query = WardsQuery(
            first: .some(first),
            after: after.apolloNullable,
            order: .some(order)
        )
        
        apollo.fetch(query: query) { result in
            let wardsData = try? result.get().data?.wards
            let endCursor = wardsData?.pageInfo.endCursor
            let wards = wardsData?.nodes?.map { Ward(apolloWard: $0) }
            completion(endCursor, wards ?? [])
        }
    }
}
