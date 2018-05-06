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
    private let dataStore = DataStore()

    weak var delegate: NoteRepositoryDelegate!

    func getNotes() {
        let notes = dataStore.getNotes()

        // FIXME: set `delegate: NoteRepositoryDelegate` in advance
        // hint: press `Command+Shift+F` to find texts in the project.
        delegate.noteRepositoryDidReceiveNotes(notes)
    }

    func save(note: Note) {
        fatalError("not implemented")
        // TODO:
        // 1. Make `dataStore.notes` variable.
        // 2. Add a new note to dataStore.
        // 3. tell delegate that the repository receives new notes.
    }

    private final class DataStore {
        //private var notes: [Note] = [...]
        func getNotes() -> [Note] {
            return [
                Note(text: "Skype family for Christmas", createdAt: Date(timeIntervalSince1970: 1514203200)),
                Note(text: "Visit Shrine for 初詣", createdAt: Date(timeIntervalSince1970: 1514764799)),
            ]
        }
    }
}
