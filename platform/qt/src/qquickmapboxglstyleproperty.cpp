#include <QQuickMapboxGLStyleProperty>

// QQuickMapboxGLStyleProperty

QQuickMapboxGLStyleProperty::QQuickMapboxGLStyleProperty(QQuickItem *parent_, Type type)
    : QQuickItem(parent_)
{
    m_map["type"] = type;
}

void QQuickMapboxGLStyleProperty::checkUpdated()
{
    if (m_map.value("type").isValid()
            && m_map.value("layer").isValid()
            && m_map.value("property").isValid()
            && m_map.value("value").isValid()) {
        emit updated(m_map);
    }
}

void QQuickMapboxGLStyleProperty::setLayer(const QString &layer)
{
    if (m_map.value("layer").toString() == layer) {
        return;
    }

    m_map["layer"] = layer;
    emit layerChanged(layer);
    checkUpdated();
}

QString QQuickMapboxGLStyleProperty::layer() const
{
    return m_map.value("layer").toString();
}

void QQuickMapboxGLStyleProperty::setProperty(const QString &property)
{
    if (m_map.value("property").toString() == property) {
        return;
    }

    m_map["property"] = property;
    emit propertyChanged(property);
    checkUpdated();
}

QString QQuickMapboxGLStyleProperty::property() const
{
    return m_map.value("property").toString();
}

void QQuickMapboxGLStyleProperty::setValue(const QVariant &value)
{
    if (m_map.value("value") == value) {
        return;
    }

    m_map["value"] = value;
    emit valueChanged(value);
    checkUpdated();
}

QVariant QQuickMapboxGLStyleProperty::value() const
{
    return m_map.value("value");
}

void QQuickMapboxGLPaintStyleProperty::setClasses(const QString &classes)
{
    if (m_map.value("classes").toString() == classes) {
        return;
    }

    m_map["classes"] = classes;
    emit classesChanged(classes);
    checkUpdated();
}

QString QQuickMapboxGLPaintStyleProperty::classes() const
{
    return m_map.value("classes").toString();
}

// QQuickMapboxGLLayoutStyleProperty

QQuickMapboxGLLayoutStyleProperty::QQuickMapboxGLLayoutStyleProperty(QQuickItem *parent_)
    : QQuickMapboxGLStyleProperty(parent_, LayoutType)
{
}

// QQuickMapboxGLPaintStyleProperty

QQuickMapboxGLPaintStyleProperty::QQuickMapboxGLPaintStyleProperty(QQuickItem *parent_)
    : QQuickMapboxGLStyleProperty(parent_, PaintType)
{
}
