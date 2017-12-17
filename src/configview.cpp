include "configview.h"

ConfigView::ConfigView(QQuickView *parent) :
    QObject(parent)
{
    dconf = new MGConfItem("/apps/turtlight/color");
    QObject::connect(dconf, SIGNAL(valueChanged()), this, SLOT(updateColor()));
    updateColor();
}

void ConfigView::setColor(qreal blue)
{
    QColor color;
    color.setBlueF(blue);
    setColor(color);
}

void ConfigView::setColor(const QColor &color)
{
    QQuickView *view = qobject_cast<QQuickView*>(parent());
    if (view) {
        view->close();
        view->setColor(color);
        view->setClearBeforeRendering(true);

        view->create();

        QPlatformNativeInterface *native = QGuiApplication::platformNativeInterface();
        native->setWindowProperty(view->handle(), QLatin1String("CATEGORY"), "notification");
        native->setWindowProperty(view->handle(), QLatin1String("MOUSE_REGION"), QRegion(0,0,0,0));

        view->show();
    }
}

void ConfigView::updateColor()
{
    QString value = dconf->value("#05001000").toString();
    setColor(QColor(value));
}
