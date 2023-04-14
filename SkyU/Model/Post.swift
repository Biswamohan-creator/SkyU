//
//  Post.swift
//  SkyU
//
//  Created by CHINAM DWARIKANATH PATRA on 12/04/23.
//

import SwiftUI
import FirebaseFirestoreSwift

// MARK: Post Model
struct Post: Identifiable, Codable, Equatable, Hashable {
    @DocumentID var id: String?
    var text: String
    var imageURL: URL?
    var imageReferenceID: String = ""
    var publishedDate: Date = Date()
    var likedIDs: [String] = []
    var disLikedIDs: [String] = []
    // MARK: Basic User Info
    var username: String
    var userUID: String
    var userProfileURL: URL
    
    enum CodingKeys: CodingKey {
        case id
        case text
        case imageURL
        case imageReferenceID
        case publishedDate
        case likedIDs
        case disLikedIDs
        case username
        case userUID
        case userProfileURL
    }
}
