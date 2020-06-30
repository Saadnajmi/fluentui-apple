//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import AppKit


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	func applicationWillFinishLaunching(_ notification: Notification) {
//		let window = NSWindow(contentViewController: TestControlsViewController(nibName: nil, bundle: nil))
		let window = NSWindow()
		window.autorecalculatesKeyViewLoop = true
		window.title = "FluentUI macOS"

		// TODO
//		window.styleMask = .fullSizeContentView
		
		let splitViewController = NSSplitViewController()
		splitViewController.addSplitViewItem(NSSplitViewItem(contentListWithViewController: TestMasterViewController()))
		splitViewController.addSplitViewItem(NSSplitViewItem(viewController: TestDatePickerController()))
		window.contentViewController = splitViewController
		
		window.setFrame(.init(origin: .zero, size: .init(width: AppDelegate.initialWindowWidth, height: AppDelegate.initialWindowHeight)), display: true)
		window.center()
		window.makeKeyAndOrderFront(self)
	}
	
	private static let initialWindowWidth: CGFloat = 800
	private static let initialWindowHeight: CGFloat = 600
}

