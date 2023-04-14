//
//  ReusablePostsVIew.swift
//  SkyU
//
//  Created by CHINAM DWARIKANATH PATRA on 13/04/23.
//

import SwiftUI
import Firebase

struct ReusablePostsView: View {
    @Binding var posts: [Post]
    /// - View Properties
    @State var isFetching: Bool = true
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                if isFetching {
                    ProgressView()
                        .padding(.top, 30)
                } else {
                    if posts.isEmpty {
                        /// - No posts found on Firestore
                        Text("No Posts Found")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top, 30)
                    } else {
                        /// - Displaying Posts
                        Posts()
                    }
                }
            }
            .padding(15)
        }
        .refreshable {
            /// - Scroll to refresh
            isFetching = true
            posts = []
            await fetchPosts()
        }
        .task {
            /// - Fetching for one time
            guard posts.isEmpty else {return}
            await fetchPosts()
        }
    }
    
    /// - Displaying Fetched Posts
    @ViewBuilder
    func Posts()-> some View {
        ForEach(posts) { post in
            PostCardView(post: post) { updatedPost in
                /// Updating Post in the Array
                if let index = posts.firstIndex(where: { post in
                    post.id == updatedPost.id
                }){
                    posts[index].likedIDs = updatedPost.likedIDs
                    posts[index].disLikedIDs = updatedPost.disLikedIDs
                }
            } onDelete: {
                /// Removing Post from the Array
                withAnimation(.easeInOut(duration: 0.25)) {
                    posts.removeAll{post == $0}
                }
            }

            Divider()
                .padding(.horizontal, -15)
        }
    }
    
    /// - Fetching Posts
    func fetchPosts() async {
        do {
            var query: Query!
            query = Firestore.firestore().collection("Posts")
                .order(by: "publishedDate", descending: true)
                .limit(to: 20)
            let docs = try await query.getDocuments()
            let fetchedPosts = docs.documents.compactMap { doc -> Post? in
                try? doc.data(as: Post.self)
            }
            await MainActor.run(body: {
                posts = fetchedPosts
                isFetching = false
            })
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ReusablePostsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
