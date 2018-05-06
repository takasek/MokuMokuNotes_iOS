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

        presenter = NotePresenter(repository: NoteRepository())

        // FIXME: remove a line below after reading the message carefully.
        fatalError("hint: Why using `delegate`? learn MVP architecture! -> https://www.slideshare.net/yudaiyokoyama3/ss-41283302")
        fatalError("hint: See the architecture of this project on the GitHub repository → https://github.com/takasek/MokuMokuNotes_iOS/#architecture")
        presenter.delegate = self

        presenter.getNotes()
    }

    @IBAction func addButtonDidTap() {
        fatalError()
        // hint: NotePresenter have a method `addNewNote()`
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

extension NoteListViewController: UITableViewDelegate {
    // FIXME: To invoke this method, you should connect `NoteListViewController` as `tableView`'s delegate.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // FIXME: set "NoteDetailViewController" to storyboard ID of NoteDetailViewController on Main.storyboard
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoteDetailViewController") as! NoteDetailViewController

        navigationController?.pushViewController(vc, animated: true)
    }
}

extension NoteListViewController: NotePresenterDelegate {
    func notePresenterDidReceiveNotes(_ notes: [Note]) {
        items = notes

        // hint: tableView is treated as ImplicitlyUnwrappedOptional
        tableView.reloadData()
    }
}
