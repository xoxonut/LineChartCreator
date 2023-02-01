#include "creator.h"
#include <QXYSeries>
Q_DECLARE_METATYPE(QAbstractSeries *)


Creator::Creator()
{
    db = new SQLloader();
    qRegisterMetaType<QAbstractSeries*>();
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
