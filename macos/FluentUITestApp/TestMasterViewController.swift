//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import AppKit

/// Master-detail view controller to implement a playground for testing various controls.
/// To add a control, add it and the type of its NSViewController to "controls"
class TestMasterViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
	private let controls: [(title: String, type: NSViewController.Type)] = [
							("FluentUI-macOS (placeholder)", TestPlaceholderViewController.self),
							("Avatar View", TestAvatarViewController.self),
							("Button", TestButtonViewController.self),
							("Date Picker", TestDatePickerController.self),
							("Link", TestLinkViewController.self),
							("Separator", TestSeparatorViewController.self)
	]
	
	override func loadView() {
		controlListView.usesAlternatingRowBackgroundColors = true
		controlListView.dataSource = self
		controlListView.delegate = self
		controlListView.addTableColumn(NSTableColumn(identifier: NSUserInterfaceItemIdentifier("Column")))
		controlListView.translatesAutoresizingMaskIntoConstraints = false
		controlListView.rowHeight = TestMasterViewController.rowHeight

		view = controlListView
		
		NSLayoutConstraint.activate([controlListView.widthAnchor.constraint(equalToConstant: 200)])
	}

	func numberOfRows(in tableView: NSTableView) -> Int {
		return controls.count
	}
	
	func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
		let textField = NSTextField(labelWithString: controls[row].title)
		textField.translatesAutoresizingMaskIntoConstraints = false
		let view = NSView(frame: .zero)
		view.addSubview(textField)
		NSLayoutConstraint.activate([textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: TestMasterViewController.textFieldLeadingPadding),
									 textField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
									 textField.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
		
		return view
	}
	
	func tableViewSelectionDidChange(_ notification: Notification) {
// 		TODO
		controlDetailViewController = controls[controlListView.selectedRow].type.init(nibName: nil, bundle: nil)
	}
	
	private var controlDetailViewController: NSViewController? {
		didSet {
			// TODO
		}
	}

	private let controlListView = NSTableView(frame: .zero)
	
	private static let rowHeight: CGFloat = 44.0
	
	private static let textFieldLeadingPadding: CGFloat = 5.0
}
