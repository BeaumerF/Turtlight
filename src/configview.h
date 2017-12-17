#ifndef CONFIGVIEW_H
#define CONFIGVIEW_H

#include <QObject>
#include <QQuickView>
#include <QColor>
#include <QGuiApplication>
#include <mlite5/MGConfItem>
#include <qpa/qplatformnativeinterface.h>
#include <QColor>

class ConfigView : public QObject
{
    Q_OBJECT
public:
    explicit ConfigView(QQuickView *parent = 0);

public slots:
    void setColor(qreal blue);
    void setColor(const QColor &color);

private slots:
    void updateColor();

private:
    MGConfItem *dconf;

};

#endif // CONFIGVIEW_H
