#ifndef SQLLOADER_H
#define SQLLOADER_H
#include<QSqlQuery>
#include<QList>
#include<QPointF>
class SQLloader
{
public:
    SQLloader();
    void loadData2List(QList<QList<qreal>>*);
    QPointF getPoint(int,int);
    int wellLen();
    int max();
private:
    QSqlDatabase db;
    QList<QList<qreal>> container;
    void openDB();
    int m_max;
};

#endif // SQLLOADER_H
