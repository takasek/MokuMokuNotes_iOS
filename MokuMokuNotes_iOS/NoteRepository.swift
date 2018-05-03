//
//  NoteRepository.swift
//  MokuMokuNotes_iOS
//
//  Created by Yoshitaka Seki on 2018/04/28.
//  Copyright © 2018年 takasek. All rights reserved.
//

import Foundation

protocol NoteRepositoryDelegate: class {
    func noteRepositoryDidReceiveNotes(_ notes: [Note])
}

final class NoteRepository {
    private let dummyDataSource = DummyDataSource()

    weak var delegate: NoteRepositoryDelegate?

    func getNotes() {
        let notes = dummyDataSource.getNotes()
        delegate?.noteRepositoryDidReceiveNotes(notes)
    }

    func save(note: Note) {
        fatalError("not implemented")
    }

    private final class DummyDataSource {
        func getNotes() -> [Note] {
            return [
                Note(text: "Skype family for Christmas", createdAt: Date(timeIntervalSince1970: 1514203200)),
                Note(text: "Visit Shrine for 初詣", createdAt: Date(timeIntervalSince1970: 1514764799)),
            ]
        }
    }
}
