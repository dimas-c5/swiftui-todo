import UIKit
import GRDB

var dbQueue: DatabaseQueue!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            let databaseURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("db.sqlite")
            dbQueue = try AppDatabase.openDatabase(atPath: databaseURL.path)
            dbQueue.setupMemoryManagement(in: application)
        } catch {
            fatalError()
        }
        return true
    }
}

