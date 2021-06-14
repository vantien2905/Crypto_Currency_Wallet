//
//  RealmHelper.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 12/06/2021.
//

import Foundation
import RealmSwift

class RealmHelper {
    static let share = RealmHelper()
    private init() {}

    var realm: Realm? {
        return try? Realm()
    }

    func createObject(_ object: Object) {
        do {
            try realm?.write {
                self.realm?.add(object)
            }
        } catch {
            print("Error saving")
        }
    }

    func deleteAll() {
        try! realm?.write {
            realm?.deleteAll()
        }
    }

    func updateObject(_ updateBlock: (() -> Void)) {
        try! realm?.write {
            updateBlock()
        }
    }

    func deleteObject(_ object: Object) {
        try! realm?.write {
            self.realm?.delete(object)
        }
    }

    func deleteObjects<T: Object>(_ objects: Array<T>) {
        try! realm?.write {
            self.realm?.delete(objects)
        }
    }

    func addObject(_ object: Object, update: Bool = true) {
        do {
            try self.realm?.write { [weak self] in
                self?.realm?.add(object, update: .modified)
            }
        } catch let error {
            print("[ERROR] Got: \(error.localizedDescription)")
        }

    }

    func addObjects(_ objects: [Object], update: Bool = true) {
        do {
            try self.realm?.write { [weak self] in
                self?.realm?.add(objects, update: .modified)
            }
        } catch let error {
            print("[ERROR] Got: \(error.localizedDescription)")
        }
    }

    func getObjects<T: Object>(_ type: T.Type) -> Results<T> {
        return realm!.objects(type)
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}

