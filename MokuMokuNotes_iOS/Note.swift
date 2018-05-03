//
//  Note.swift
//  MokuMokuNotes_iOS
//
//  Created by Yoshitaka Seki on 2018/04/28.
//  Copyright © 2018年 takasek. All rights reserved.
//

import Foundation

struct Note: Equatable {
    let text: String
    let createdAt: Date
    let completed: Bool
    let completedAt: Date?

    init(text: String, createdAt: Date, completed: Bool = false, completedAt: Date? = nil) {
        self.text = text
        self.createdAt = createdAt
        self.completed = completed
        self.completedAt = completedAt
    }

    static func ==(lhs: Note, rhs: Note) -> Bool {
        return lhs.text == rhs.text
            && lhs.createdAt == rhs.createdAt
            && lhs.completed == rhs.completed
            && lhs.completedAt == rhs.completedAt
    }
}
