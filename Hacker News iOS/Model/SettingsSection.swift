//
//  SettingsRow.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/27/25.
//
struct SettingsRow {
    let icon: String
    let title: String
    var detail: String? = nil
    let kind: RowKind
    
    enum RowKind {
        case disclosure
        case toggle(isOn: Bool)
    }
}

struct SettingsSection {
    var rows: [SettingsRow]
    
    static func sampleData() -> [SettingsSection] {
        return [
            SettingsSection(rows: [
                SettingsRow(icon: "airplane.circle.fill", title: "Airplane Mode", kind: .toggle(isOn: false)),
                SettingsRow(icon: "wifi", title: "Wi-Fi", detail: "Mikasa", kind: .disclosure),
                SettingsRow(icon: "beats.studiobuds.plus.chargingcase.fill", title: "Bluetooth",
                            detail: "On", kind: .disclosure),
                SettingsRow(icon: "antenna.radiowaves.left.and.right.circle.fill", title: "Cellular", kind: .disclosure),
                SettingsRow(icon: "personalhotspot.circle.fill", title: "Personal Hotspot", detail: "Off", kind: .disclosure),
                SettingsRow(icon: "battery.100.circle.fill", title: "Battery", kind: .disclosure)
            ]),
            SettingsSection(rows: [
                SettingsRow(icon:  "gearshape.fill", title: "General", kind: .disclosure),
                SettingsRow(icon:  "accessibility", title: "Accessibility", kind: .disclosure),
                SettingsRow(icon:  "hand.tap", title: "Action Button", kind: .disclosure),
                SettingsRow(icon:  "apple.intelligence", title: "Apple Intelligence & Siri", kind: .disclosure),
                SettingsRow(icon:  "camera.fill", title: "Camera",  kind: .disclosure),
                SettingsRow(icon:  "switch.2", title: "Control Center", kind: .disclosure),
                SettingsRow(icon:  "sun.max.circle.fill", title: "Display & Brightness", kind: .disclosure),
                SettingsRow(icon:  "apps.iphone", title: "Home Screen & App Library", kind: .disclosure),
                SettingsRow(icon:  "magnifyingglass", title: "Search", kind: .disclosure),
                SettingsRow(icon:  "display", title: "StandBy",  kind: .disclosure),
                SettingsRow(icon:  "photo.on.rectangle", title: "Wallpaper", kind: .disclosure)
            ]),
            SettingsSection(rows: [
                SettingsRow(icon:  "bell.badge.fill", title: "Notifications", kind: .disclosure),
                SettingsRow(icon:  "speaker.wave.3.fill", title: "Sounds & Haptics", kind: .disclosure),
                SettingsRow(icon:  "moon.fill", title: "Focus", kind: .disclosure),
                SettingsRow(icon:  "hourglass", title: "Screen Time", kind: .disclosure)
            ]),
            SettingsSection(rows: [
                SettingsRow(icon:  "faceid", title: "Face ID & Passcode", kind: .disclosure),
                SettingsRow(icon:  "sos", title: "Emergency SOS", kind: .disclosure),
                SettingsRow(icon:  "lock.shield", title: "Privacy & Security", kind: .disclosure)
            ]),
            SettingsSection(rows: [
                SettingsRow(icon:  "gamecontroller.fill", title: "Game Center", kind: .disclosure),
                SettingsRow(icon:  "icloud", title: "iCloud", kind: .disclosure),
                SettingsRow(icon:  "creditcard", title: "Wallet & Apple Pay", kind: .disclosure)
            ]),
            SettingsSection(rows: [
                SettingsRow(icon: "square.grid.3x2.fill", title: "Apps", kind: .disclosure)
            ])
        ]
    }
}


