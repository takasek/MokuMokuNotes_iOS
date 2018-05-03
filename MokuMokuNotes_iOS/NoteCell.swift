//
//  NoteCell.swift
//  MokuMokuNotes_iOS
//
//  Created by Yoshitaka Seki on 2018/04/28.
//  Copyright © 2018年 takasek. All rights reserved.
//

import UIKit

final class NoteCell: UITableViewCell {
    func bind(note: Note) {
        textLabel?.text = note.text
        detailTextLabel?.text = note.createdAt.description
    }
}

