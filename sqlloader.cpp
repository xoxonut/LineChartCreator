#include "sqlloader.h"
#include<iostream>
#include<QVariant>
SQLloader::SQLloader()
{
    m_max=0;
    openDB();
    QSqlQuery query;
    for(auto i=0; i<9 ;i++){
        container.push_back(QList<qreal>());
    }
    query.exec("SELECT * FROM example");
    std::cerr<<"query suceess"<<std::endl;
    while(query.next()){
        for(auto i=0; i<9; i++){
            int tmp = query.value(i).toInt();
            container[i].push_back(tmp);
            if(m_max<tmp){
                m_max=tmp;
            }

        }
    }
    db.close();
}

void SQLloader::openDB(){
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("example.db");
    if(!db.open()){
        std::cerr<<"db open fail"<<std::endl;
    }else{
        std::cerr<<"db open sucess"<<std::endl;
    }


}
QPointF SQLloader::getPoint(int fir ,int sec){
        return QPointF(container[0][sec],container[fir][sec]);
}
void SQLloader::loadData2List(QList<QList<qreal>> *list){
    for(auto well : container){
        auto tmp = well.mid(0,well.size());
        list->append(tmp);
    }
}
int SQLloader::wellLen(){
    return container[0].size();
}
int SQLloader::max(){
    return m_max;
}
