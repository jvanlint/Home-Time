//
//  NotificationViewController.swift
//  Home Time
//
//  Created by Jason van Lint on 8/2/21.
//

import UIKit
import UserNotifications

class NotificationViewController: UIViewController {

    var tramTime: Date?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapNotification(_ sender: Any) {
        requestPermission()
        makeNotification()
        self.navigationController?.popViewController(animated: true)
    }

    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func makeNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Tram Alert"
        content.subtitle = "Your tram is approaching. Get moving!"
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }

    /**
     Will hide the keyboard if the screen is touched.
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

}
