// SPDX-FileCopyrightText: 2025 BLOAT OS Team
// SPDX-License-Identifier: GPL-2.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import org.kde.kirigami as Kirigami
import org.kde.kirigamiaddons.formcard as FormCard

import org.kde.plasmasetup.components as PlasmaSetupComponents

PlasmaSetupComponents.SetupModule {
    id: root

    nextEnabled: true

    property var selections: {
        "ai": true,
        "games": true,
        "browsers": true,
        "dev": true,
        "media": true,
        "themes": true,
        "fun": true,
        "office": true
    }

    function onPageActivated() {
        // All bloat is selected by default because this is BLOAT OS
    }

    cardWidth: Math.min(Kirigami.Units.gridUnit * 32, root.contentItem.width - Kirigami.Units.gridUnit * 2)

    contentItem: ScrollView {
        id: scroll
        clip: true

        ColumnLayout {
            id: mainColumn
            width: scroll.availableWidth
            spacing: Kirigami.Units.gridUnit

            // Title
            Label {
                Layout.fillWidth: true
                Layout.leftMargin: Kirigami.Units.gridUnit
                Layout.rightMargin: Kirigami.Units.gridUnit
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
                text: i18n("<h2>BLOAT OS Package Selector</h2><br/>Choose what bloat you want installed.<br/>By default, EVERYTHING is selected because this is <b>BLOAT OS</b>.")
                textFormat: Text.RichText
            }

            // AI & ML
            FormCard.FormCard {
                Layout.alignment: Qt.AlignHCenter
                maximumWidth: root.cardWidth

                FormCard.FormSwitchDelegate {
                    text: i18n("AI & Machine Learning")
                    description: i18n("Ollama, PyTorch, TensorFlow, NumPy, Pandas")
                    checked: root.selections.ai
                    onCheckedChanged: root.selections.ai = checked
                }
            }

            // Gaming
            FormCard.FormCard {
                Layout.alignment: Qt.AlignHCenter
                maximumWidth: root.cardWidth

                FormCard.FormSwitchDelegate {
                    text: i18n("Gaming")
                    description: i18n("Steam, Lutris, Wine, GameMode, MangoHud, Heroic")
                    checked: root.selections.games
                    onCheckedChanged: root.selections.games = checked
                }
            }

            // Browsers
            FormCard.FormCard {
                Layout.alignment: Qt.AlignHCenter
                maximumWidth: root.cardWidth

                FormCard.FormSwitchDelegate {
                    text: i18n("Extra Browsers")
                    description: i18n("Brave, Zen Browser")
                    checked: root.selections.browsers
                    onCheckedChanged: root.selections.browsers = checked
                }
            }

            // Development
            FormCard.FormCard {
                Layout.alignment: Qt.AlignHCenter
                maximumWidth: root.cardWidth

                FormCard.FormSwitchDelegate {
                    text: i18n("Development Tools")
                    description: i18n("Docker, Podman, Node.js, npm, extra Python tools")
                    checked: root.selections.dev
                    onCheckedChanged: root.selections.dev = checked
                }
            }

            // Media & Creative
            FormCard.FormCard {
                Layout.alignment: Qt.AlignHCenter
                maximumWidth: root.cardWidth

                FormCard.FormSwitchDelegate {
                    text: i18n("Media & Creative")
                    description: i18n("OBS Studio, Krita, Kdenlive, VLC, FFmpeg, ImageMagick")
                    checked: root.selections.media
                    onCheckedChanged: root.selections.media = checked
                }
            }

            // Themes & Eye Candy
            FormCard.FormCard {
                Layout.alignment: Qt.AlignHCenter
                maximumWidth: root.cardWidth

                FormCard.FormSwitchDelegate {
                    text: i18n("Themes & Eye Candy")
                    description: i18n("Papirus icons, wallpapers, Conky, Variety, Neofetch")
                    checked: root.selections.themes
                    onCheckedChanged: root.selections.themes = checked
                }
            }

            // Fun & Useless
            FormCard.FormCard {
                Layout.alignment: Qt.AlignHCenter
                maximumWidth: root.cardWidth

                FormCard.FormSwitchDelegate {
                    text: i18n("Fun & Useless")
                    description: i18n("cmatrix, cowsay, figlet, lolcat, nyancat, sl, cbonsai, asciiquarium, oneko, xeyes")
                    checked: root.selections.fun
                    onCheckedChanged: root.selections.fun = checked
                }
            }

            // Office
            FormCard.FormCard {
                Layout.alignment: Qt.AlignHCenter
                maximumWidth: root.cardWidth

                FormCard.FormSwitchDelegate {
                    text: i18n("Office Suite")
                    description: i18n("LibreOffice Fresh, OnlyOffice")
                    checked: root.selections.office
                    onCheckedChanged: root.selections.office = checked
                }
            }

            // Warning label
            Label {
                Layout.fillWidth: true
                Layout.leftMargin: Kirigami.Units.gridUnit
                Layout.rightMargin: Kirigami.Units.gridUnit
                Layout.topMargin: Kirigami.Units.gridUnit
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
                text: i18n("<i>Note: The actual installation will happen on your first login after setup is complete. You can change your selections then.</i>")
                textFormat: Text.RichText
                color: Kirigami.ColorUtils.tintWithAlpha(Kirigami.Theme.textColor, Kirigami.Theme.backgroundColor, 0.6)
            }
        }
    }
}
