//
//  NoteListViewController.swift
//  MokuMokuNotes_iOS
//
//  Created by Yoshitaka Seki on 2018/04/28.
//  Copyright © 2018年 takasek. All rights reserved.
//

import UIKit

final class NoteListViewController: UIViewController {

    // FIXME: connect outlet
    @IBOutlet weak var tableView: UITableView!

    private var presenter: NotePresenter!

    private var items: [Note] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = NotePresenter(
            repository: NoteRepository()
        )
        presenter.delegate = self

        presenter.getNotes()
    }

    @IBAction func addButtonDidTap() {
        fatalError("not implemented")
    }
}

extension NoteListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // FIXME: register NoteCell to tableView using reuseidentifier "NoteCell" on Main.storyboard at first
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteCell

        // FIXME: bind Note in items[indexPath.row] to cell

        return cell
    }
}

extension NoteListViewController: NotePresenterDelegate {
    func notePresenterDidReceiveNotes(_ notes: [Note]) {
        items = notes

        tableView.reloadData()
    }
}
