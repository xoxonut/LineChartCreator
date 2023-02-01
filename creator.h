#ifndef CREATOR_H
#define CREATOR_H

#include <QObject>
#include <QtCharts/QAbstractSeries>
#include "sqlloader.h"
QT_CHARTS_USE_NAMESPACE
class Creator : public QObject
{
    Q_OBJECT
public:
    Creator();
    Q_INVOKABLE void setSeries(QAbstractSeries *,int);
private:
    SQLloader *db;
};

#endif // CREATOR_H
