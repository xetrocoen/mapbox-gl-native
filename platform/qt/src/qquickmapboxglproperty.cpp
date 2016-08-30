#include <QQuickMapboxGLProperty>

// QQuickMapboxGLProperty

QQuickMapboxGLProperty::QQuickMapboxGLProperty(QQuickItem *parent_, Type type)
    : QQuickItem(parent_)
{
    m_map["type"] = type;
}

void QQuickMapboxGLProperty::checkUpdated()
{
    if (m_map.value("type").isValid()
            && m_map.value("layer").isValid()
            && m_map.value("property").isValid()
            && m_map.value("value").isValid()) {
        emit updated(m_map);
    }
}

void QQuickMapboxGLProperty::setLayer(const QString &layer)
{
    if (m_map.value("layer").toString() == layer) {
        return;
    }

    m_map["layer"] = layer;
    emit layerChanged(layer);
    checkUpdated();
}

QString QQuickMapboxGLProperty::layer() const
{
    return m_map.value("layer").toString();
}

void QQuickMapboxGLProperty::setProperty(const QString &property)
{
    if (m_map.value("property").toString() == property) {
        return;
    }

    m_map["property"] = property;
    emit propertyChanged(property);
    checkUpdated();
}

QString QQuickMapboxGLProperty::property() const
{
    return m_map.value("property").toString();
}

void QQuickMapboxGLProperty::setValue(const QVariant &value)
{
    if (m_map.value("value") == value) {
        return;
    }

    m_map["value"] = value;
    emit valueChanged(value);
    checkUpdated();
}

QVariant QQuickMapboxGLProperty::value() const
{
    return m_map.value("value");
}

void QQuickMapboxGLPaintProperty::setClasses(const QString &classes)
{
    if (m_map.value("classes").toString() == classes) {
        return;
    }

    m_map["classes"] = classes;
    emit classesChanged(classes);
    checkUpdated();
}

QString QQuickMapboxGLPaintProperty::classes() const
{
    return m_map.value("classes").toString();
}

// QQuickMapboxGLLayoutProperty

QQuickMapboxGLLayoutProperty::QQuickMapboxGLLayoutProperty(QQuickItem *parent_)
    : QQuickMapboxGLProperty(parent_, LayoutType)
{
}

// QQuickMapboxGLPaintProperty

QQuickMapboxGLPaintProperty::QQuickMapboxGLPaintProperty(QQuickItem *parent_)
    : QQuickMapboxGLProperty(parent_, PaintType)
{
}
