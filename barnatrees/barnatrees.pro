TEMPLATE = app
QT += sql quick quickcontrols2 qml network positioning location
CONFIG += c++11 lrelease embed_translations
LRELEASE_DIR='.'
QM_FILES_RESOURCE_PREFIX='/'
win32:VERSION = 0.0.5.0
else:VERSION = 0.0.5
DEFINES += APPVER=$$VERSION
DEFINES += GITVER=$$system(git describe --always)
DEFINES += QT_DEPRECATED_WARNINGS

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
ANDROID_FEATURES = android.hardware.location.network android.hardware.location.gps
ANDROID_VERSION_CODE = 005
ANDROID_VERSION_NAME = v0.0.5

HEADERS += \
    src/basemodel.h \
    src/dropboxdownloader.h \
    src/gendermodel.h \
    src/plantmodel.h \
    src/plantproxymodel.h \
    src/speciesmodel.h \
    src/splashwindow.h \
    src/streetlistmodel.h \
    src/summarymodel.h

SOURCES = \
    src/basemodel.cpp \
    src/dropboxdownloader.cpp \
    src/gendermodel.cpp \
    src/main.cpp \
    src/plantmodel.cpp  \
    src/plantproxymodel.cpp \
    src/speciesmodel.cpp \
    src/splashwindow.cpp \
    src/streetlistmodel.cpp \
    src/summarymodel.cpp

RESOURCES += \
    qml/qml.qrc \
    images/images.qrc

exists(barnatrees.db.7z) {
    !exists(barnatrees.txt) {
        unix:system($$PWD/barnatrees.sh)
        win32:system($$PWD/barnatrees.cmd)
    }
    RESOURCES += data.qrc
} else {
    error("barnatrees.db.7z missing")
}

DISTFILES += \
    Info.plist.app \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle.properties \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    qml/BalloonTip.qml \
    qml/MainWindow.qml \
    qml/AboutDialog.qml \
    qml/GenderSearchDialog.qml \
    qml/HomePage.qml \
    qml/Marker.qml \
    qml/MsgDialog.qml \
    qml/ResultsPage.qml \
    qml/SettingsDialog.qml \
    qml/SpecieSearchDialog.qml \
    qml/SpecimenDialog.qml \
    qml/StreetSearchDialog.qml \
    qml/qtquickcontrols2.conf \
    images/barnatrees_icon32.png \
    images/barnatrees_icon64.png \
    images/icons/example/index.theme \
    images/icons/example/20x20/back.png \
    images/icons/example/20x20/drawer.png \
    images/icons/example/20x20/menu.png \
    images/icons/example/20x20@2/back.png \
    images/icons/example/20x20@2/drawer.png \
    images/icons/example/20x20@2/menu.png \
    images/icons/example/20x20@3/back.png \
    images/icons/example/20x20@3/drawer.png \
    images/icons/example/20x20@3/menu.png \
    images/icons/example/20x20@4/back.png \
    images/icons/example/20x20@4/drawer.png \
    images/icons/example/20x20@4/menu.png \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    android/res/values/theme.xml \
    android/res/drawable/splash.xml \
    android/res/drawable-hdpi/icon.png \
    android/res/drawable-ldpi/icon.png \
    android/res/drawable-mdpi/icon.png \
    android/res/drawable-hdpi/logo.png \
    android/res/drawable-ldpi/logo.png \
    android/res/drawable-mdpi/logo.png

TRANSLATIONS = \
    translations/barnatrees_ca.ts \
    translations/barnatrees_en.ts \
    translations/barnatrees_es.ts \
    translations/barnatrees_nl.ts

win32 {
    RC_ICONS = images/barnatrees.ico
    QMAKE_TARGET_COMPANY = "Pedro Lopez-Cabanillas"
    QMAKE_TARGET_DESCRIPTION = "Barcelona Trees; a guide of the trees of Barcelona" 
    QMAKE_TARGET_COPYRIGHT = "Copyright (C) 2019-2023 Pedro Lopez-Cabanillas"
    QMAKE_TARGET_PRODUCT = "Barcelona Trees"
}

macx {
    ICON = images/barnatrees.icns
    QMAKE_TARGET_BUNDLE_PREFIX = com.github
    QMAKE_BUNDLE = barnatrees
    QMAKE_INFO_PLIST = Info.plist.app
}

LCONVERT_LANGS=ca es nl
include(../lconvert.pri)
include(../openssl.pri)
include(../q7zip.pri)

ANDROID_EXTRA_LIBS = \
    $$PWD/../android/libq7z_armeabi-v7a.so \
    $$PWD/../android/libq7z_arm64-v8a.so \
    $$PWD/../android/libq7z_x86.so \
    $$PWD/../android/libq7z_x86_64.so \
    $$PWD/../../../../AppData/Local/Android/Sdk/android_openssl/latest/arm/libcrypto_1_1.so \
    $$PWD/../../../../AppData/Local/Android/Sdk/android_openssl/latest/arm/libssl_1_1.so \
    $$PWD/../../../../AppData/Local/Android/Sdk/android_openssl/latest/arm64/libcrypto_1_1.so \
    $$PWD/../../../../AppData/Local/Android/Sdk/android_openssl/latest/arm64/libssl_1_1.so \
    $$PWD/../../../../AppData/Local/Android/Sdk/android_openssl/latest/x86/libcrypto_1_1.so \
    $$PWD/../../../../AppData/Local/Android/Sdk/android_openssl/latest/x86/libssl_1_1.so \
    $$PWD/../../../../AppData/Local/Android/Sdk/android_openssl/latest/x86_64/libcrypto_1_1.so \
    $$PWD/../../../../AppData/Local/Android/Sdk/android_openssl/latest/x86_64/libssl_1_1.so \
