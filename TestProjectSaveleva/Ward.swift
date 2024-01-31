//
//  Ward.swift
//  TestProjectSaveleva
//
//  Created by Ekaterina Saveleva on 30.01.2024.
//

import Pomosch

struct Ward {
    let name: String
    let photoUrlString: String
    
    init(apolloWard: WardsQuery.Data.Wards.Node ) {
        self.name = apolloWard.publicInformation.name.displayName
        self.photoUrlString = apolloWard.publicInformation.photo.url
    }
}
