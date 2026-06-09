//
//  NetworkGeneration.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 09/06/26.
//


import Foundation

/// Represents the cellular network generation.
public enum NetworkGeneration: String, Sendable {

    case secondGeneration = "2G"

    case thirdGeneration = "3G"

    case fourthGeneration = "4G"

    case fifthGeneration = "5G"

    case unknown
}