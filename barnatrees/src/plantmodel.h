#ifndef PLANTMODEL_H
#define PLANTMODEL_H

#include <QObject>
#include <QSqlRelationalTableModel>
#include <QGeoCoordinate>
#include "basemodel.h"

class PlantModel : public QSqlRelationalTableModel, public BaseModel
{
	Q_OBJECT
public:
	PlantModel(QObject *parent = nullptr, QSqlDatabase db = QSqlDatabase());
    ~PlantModel() override;

	Q_INVOKABLE QVariant data( const QModelIndex & index, int role = Qt::DisplayRole ) const override;
    QHash<int, QByteArray> roleNames() const override;
	QString selectStatement() const override;
	bool select() override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;

    Q_INVOKABLE void setCenter(QGeoCoordinate center);
    Q_INVOKABLE void setSpecies(int idSpecies);
    Q_INVOKABLE void setGender(QString gen);
    Q_INVOKABLE void setStreet(QString street);
    Q_INVOKABLE QGeoCoordinate plantCoordinate(int row) const;
    Q_INVOKABLE qreal plantDistance(int row) const;
    Q_INVOKABLE QString formattedDistance(int row) const;
    Q_INVOKABLE QString formattedScientificName(int row) const;
    Q_INVOKABLE QString wikiLink(int row) const;
    Q_INVOKABLE QString streetLink(int row) const;

	int limit() const;
	void setLimit(int limit);

private:
	QGeoCoordinate CoordinateToCoordinate(QGeoCoordinate point, double range, double bearing) const;
    QGeoCoordinate m_center, m_p1, m_p2, m_p3, m_p4; //, m_nearestCoordinate;
	int m_limit;
};

#endif // PLANTMODEL_H
