//
//  NewTweetView.swift
//  Q
//
//  Created by Consultant on 20/10/2023.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    @ObservedObject var viewModel: UploadTweetViewModel
    
    var tweet: Tweet?
    
    init(isPresented: Binding<Bool>, tweet: Tweet?) {
        self._isPresented = isPresented
        self.viewModel = UploadTweetViewModel(isPresented: isPresented, tweet: tweet)
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { isPresented.toggle() }, label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                })
                Spacer()
                
                Button(action: { viewModel.uploadTweet(caption: captionText) }, label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                })
            }.padding()
            
            if let tweet = tweet {
                HStack {
                    Text("Replying to")
                        .foregroundColor(.gray)
                    Text("@\(tweet.username)")
                        .foregroundColor(.blue)
                    
                    Spacer()
                }
                .font(.system(size: 14))
                .padding(.leading)
            }
            
            HStack(alignment: .top) {
                KFImage(viewModel.profileImageUrl)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .cornerRadius(32)
                
                TextArea(viewModel.placeholderText, text: $captionText)
                
                Spacer()
            }.padding()
            Spacer()
        }
    }
}
