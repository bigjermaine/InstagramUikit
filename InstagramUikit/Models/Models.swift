//
//  Models.swift
//  InstagramUikit
//
//  Created by Apple on 07/03/2023.
//

import Foundation

public enum userPostType {
    case photo,video
    
    
}

enum Gender {
    case male
    case female
    
}
 struct users {
    let username:String
    let name: (first:String, last:String)
    let birthdate:Date
    let gender: Gender
    let counts:userCount
    let joinDate:Date
    let profilepicture:URL
    
}

struct userCount {
    let followers:Int
    let followind:Int
    let posts:Int
    
}
public struct PostModel {
    let identifier:String
    let postType:userPostType
    let thumbnailImage:URL
    let postUrl:URL
    let caption:String
    let likecount:[ PostLikes]
    let comments: [PostComments]
    let CreatedDate:Date
    let taggedUsers: [users]
}

struct PostLikes{
    let username:String
    let postIdentifier:String
}

struct CommentLikes{
    let username:String
    let postIdentifier:String
}
struct PostComments {
    let identifier: String
    let username:String
    let text:String
    let createDate:Date
    let likes: [CommentLikes]
}
