//
//  NewsModel.swift
//  News Pulse
//
//  Created by alagu-raja
//
import UIKit

// MARK: - NewsModel
struct NewsModel: Codable {
    let totalResults: Int
    let status: String
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let content: String?
    let urlToImage: URL?
    let title: String?
    let publishedAt: String?
    let description: String?
    let url: URL?
}

//MARK: SourceModel
struct SourcesModel: Codable {
    let status: String
    let sources: [Source]
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
    let description: String?
    let url: URL?
}


//MARK: - GET SOURCES
struct GetSourceModel: Codable {
    let status: String!
    let sources: [Source]
}
