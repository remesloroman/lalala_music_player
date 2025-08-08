#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "playercontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    PlayerController *playerController = new PlayerController(&app);
    qmlRegisterSingletonInstance("com.lalala.controllers.PlayerController", 1, 0, "PlayerController", playerController);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("TestPlayer", "Main");

    return app.exec();
}
