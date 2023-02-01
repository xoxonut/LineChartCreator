#include "creator.h"
#include <QXYSeries>
#include<iostream>
#include<QDebug>
Q_DECLARE_METATYPE(QAbstractSeries *)
Q_DECLARE_METATYPE(QObject *)

Creator::Creator()
{
    db = new SQLloader();
    qRegisterMetaType<QAbstractSeries*>();
    qRegisterMetaType<QObject*>();
}

void Creator::setSeries(QAbstractSeries *series,int well){
    if(series){
        auto xySeries = static_cast<QXYSeries*>(series);
        xySeries->clear();
        for(int i=0; i<db->wellLen(); i++){
            xySeries->append(db->getPoint(well,i));
        }
    }
}

int Creator::maxY(){
    return db->max();
}

