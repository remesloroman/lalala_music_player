cmake_minimum_required(VERSION 3.16)

project(TestPlayer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appTestPlayer
    main.cpp
)

qt_add_qml_module(appTestPlayer
    URI TestPlayer
    VERSION 1.0
    QML_FILES
        Main.qml

    RESOURCES
    assets/icons/Menu.png
    assets/icons/search.png
    assets/icons/back.png
    assets/icons/forward.png
    assets/icons/play.png
    assets/icons/background.png
    assets/icons/internet.png
    assets/icons/songs.png
    assets/icons/playlists.png
    assets/icons/authors.png
    assets/icons/albums.png
    assets/icons/equalizer.png

    QML_FILES TestModel.qml
    QML_FILES ImageButton.qml
    QML_FILES LeftPanel.qml
    QML_FILES LeftPanelModel.qml
    QML_FILES MenuOverlay.qml
    QML_FILES Separator.qml
    SOURCES audioinfo.h audioinfo.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTestPlayer PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTestPlayer
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTestPlayer
    PRIVATE Qt6::Quick
)
target_link_libraries(appTestPlayer PRIVATE Qt6::Core)

include(GNUInstallDirs)
install(TARGETS appTestPlayer
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
