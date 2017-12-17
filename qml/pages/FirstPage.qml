import QtQuick 2.1
import Sailfish.Silica 1.0

;import org.nemomobile.configuration 1.0

Page {
    id: page
    objectName: "mainPage"

    SilicaFlickable {
        id: flick
        anchors.fill: page
        contentHeight: content.height

        PullDownMenu {
            MenuItem {
                text: overlayRunning ? "Close overlay" : "Start overlay"
                onClicked: {
                    switchOverlay();
                }
            }

            /*MenuItem {
                text: "About"
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }*/
        }

        Column {
            id: content
            width: parent.width

            PageHeader {
                title: "Turtlight"
            }

            Slider {
                id: blueSlider
                width: parent.width
                label: "Blue reduction %"
                minimumValue: 0
                maximumValue: 100
                stepSize: 1
                value: 0
                valueText: value
                onReleased: writeColor()
            }

            Slider {
                id: alphaSlider
                width: parent.width
                label: "Alpha intensity %"
                minimumValue: 1
                maximumValue: 100
                stepSize: 1
                value: 0
                valueText: value
                onReleased: writeColor()
            }
        }
    }

    function blankColor() {
        var newColor = colorHelper.colorString(Qt.rgba((blueSlider.value * 2.5) / 255.0,
                                                       (blueSlider.value * 2.5) / 255.0,
                                                       0,
                                                       0))
        configuration.color = newColor
    }

    function writeColor() {
        var newColor = colorHelper.colorString(Qt.rgba((blueSlider.value * 2.5) / 255.0,
                                                       (blueSlider.value * 2.5) / 255.0,
                                                       0,
                                                       (alphaSlider.value * 1.28) / 255.0))
        configuration.color = newColor
    }

    function switchOverlay() {
        if (overlayRunning) {
            overlayRunning = false;
            blueSlider.enabled = false;
            alphaSlider.enabled = false;
            blankColor();
        }
        else {
            overlayRunning = true;
            blueSlider.enabled = true;
            alphaSlider.enabled = true;
            writeColor()
        }
    }

    Item {
        Rectangle {
            width: Screen.width
            height: Screen.height
            color: configuration.color
        }
    }

    ConfigurationGroup {
        id: configuration
        path: "/apps/harbour-tint-overlay"
        property string color: "#05001000"
    }

    Component.onCompleted: {
        helper.checkOverlay();
    }
}
