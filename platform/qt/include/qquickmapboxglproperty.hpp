#ifndef QQUICKMAPBOXGLPROPERTY_H
#define QQUICKMAPBOXGLPROPERTY_H

#include <QQuickItem>

class Q_DECL_EXPORT QQuickMapboxGLProperty : public QQuickItem
{
    Q_OBJECT

    Q_PROPERTY(QString layer READ layer WRITE setLayer NOTIFY layerChanged)
    Q_PROPERTY(QString property READ property WRITE setProperty NOTIFY propertyChanged)
    Q_PROPERTY(QVariant value READ value WRITE setValue NOTIFY valueChanged)

public:
    enum Type {
        LayoutType = 0,
        PaintType,
    };

    virtual ~QQuickMapboxGLProperty() {}

    void setLayer(const QString &);
    QString layer() const;

    void setProperty(const QString &);
    QString property() const;

    void setValue(const QVariant &);
    QVariant value() const;

public slots:
    void checkUpdated();

signals:
    void layerChanged(const QString &);
    void propertyChanged(const QString &);
    void valueChanged(const QVariant &);
    void updated(const QVariantMap& params);

protected:
    QQuickMapboxGLProperty(QQuickItem *parent, Type);

    QVariantMap m_map;
};

class Q_DECL_EXPORT QQuickMapboxGLLayoutProperty : public QQuickMapboxGLProperty
{
public:
    QQuickMapboxGLLayoutProperty(QQuickItem *parent = 0);
    virtual ~QQuickMapboxGLLayoutProperty() {}
};

class Q_DECL_EXPORT QQuickMapboxGLPaintProperty : public QQuickMapboxGLProperty
{
    Q_OBJECT
    Q_PROPERTY(QString classes READ classes WRITE setClasses NOTIFY classesChanged)

public:
    QQuickMapboxGLPaintProperty(QQuickItem *parent = 0);
    virtual ~QQuickMapboxGLPaintProperty() {}

    void setClasses(const QString &);
    QString classes() const;

signals:
    void classesChanged(const QString &);
};

#endif // QQUICKMAPBOXGLPROPERTY_H
