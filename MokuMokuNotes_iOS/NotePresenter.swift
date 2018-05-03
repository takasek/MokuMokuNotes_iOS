//
//  NotePresenter.swift
//  MokuMokuNotes_iOS
//
//  Created by Yoshitaka Seki on 2018/04/28.
//  Copyright © 2018年 takasek. All rights reserved.
//

import Foundation

protocol NotePresenterDelegate: class {
    func notePresenterDidReceiveNotes(_ notes: [Note])
}

final class NotePresenter {
    private let repository: NoteRepository
    private weak var delegate: NotePresenterDelegate?

    init(repository: NoteRepository, delegate: NotePresenterDelegate) {
        self.repository = repository
        // FIXME: set self to repository's delegate

        self.delegate = delegate
    }

    func getNotes() {
        repository.getNotes()
    }

    func saveNote(text: String) {
        let note = Note(text: text, createdAt: Date())
        repository.save(note: note)
    }
}

extension NotePresenter: NoteRepositoryDelegate {
}

