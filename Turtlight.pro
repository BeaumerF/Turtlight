# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = Turtlight

QT += gui-private

CONFIG += sailfishapp

PKGCONFIG += mlite5

SOURCES += src/Turtlight.cpp \
    src/colorhelper.cpp \
    src/viewhelper.cpp

DISTFILES += qml/Turtlight.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/Turtlight.changes.in \
    rpm/Turtlight.changes.run.in \
    rpm/Turtlight.spec \
    rpm/Turtlight.yaml \
    translations/*.ts \
    Turtlight.desktop \
    qml/settings.qml \
    qml/overlay.qml

SAILFISHAPP_ICONS = 86x86 108x108 128x128

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/Turtlight-de.ts

HEADERS += \
    src/colorhelper.h \
    src/viewhelper.h
