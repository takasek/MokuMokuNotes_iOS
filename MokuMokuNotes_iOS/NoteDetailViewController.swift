//
//  NoteDetailViewController.swift
//  MokuMokuNotes_iOS
//
//  Created by Yoshitaka Seki on 2018/05/05.
//  Copyright © 2018年 takasek. All rights reserved.
//

import UIKit

final class NoteDetailViewController: UIViewController {
    @IBOutlet private var textlabel: UILabel!
    @IBOutlet private var createdAtLabel: UILabel!
    @IBOutlet private var completedLabel: UILabel!
    @IBOutlet private var completedAtLabel: UILabel!

    var note: Note!

    override func viewDidLoad() {
        super.viewDidLoad()

        textlabel.text = note.text
        createdAtLabel.text = note.createdAt.description
        completedLabel.text = note.completed ? "✅" : "📝"
        completedAtLabel.text = note.completedAt?.description
    }
}
