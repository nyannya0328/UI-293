//
//  Post.swift
//  Post
//
//  Created by nyannyan0328 on 2021/08/24.
//

import SwiftUI

struct Post: Identifiable,Hashable {
    var id = UUID().uuidString
    var imageURL : String
}

