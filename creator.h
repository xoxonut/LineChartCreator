#ifndef CREATOR_H
#define CREATOR_H

#include <QObject>
#include <QtCharts/QAbstractSeries>
#include <QtCharts/QChart>
#include <QtCharts/QChartView>
#include "sqlloader.h"

QT_CHARTS_USE_NAMESPACE
class Creator : public QObject
{
    Q_OBJECT

public:
    Creator();
    Q_INVOKABLE void setSeries(QAbstractSeries *,int);
    Q_INVOKABLE int maxY();
private:
    SQLloader *db;

};

#endif // CREATOR_H
