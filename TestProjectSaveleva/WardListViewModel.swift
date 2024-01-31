//
//  WardListViewModel.swift
//  TestProjectSaveleva
//
//  Created by Ekaterina Saveleva on 30.01.2024.
//

import Foundation


final class WardListViewModel {
    
    private(set) var wards: [Ward] = []
    private var endCursor: String?
    private let pageSize = 20
    private var isLoading = false
    
    func fetchWards(completion: @escaping () -> Void) {
        guard !isLoading else { return }
        isLoading = true
        NetworkService.shared.fetchWards(first: pageSize, after: endCursor, order: [.init(publicInformation: .some(.init(name: .some(.init(displayName: .some(.case(.asc)))))))]) { [weak self] endCursor, wards in
            self?.endCursor = endCursor
            self?.wards.append(contentsOf: wards)
            self?.isLoading = false
            completion()
        }
    }
}
