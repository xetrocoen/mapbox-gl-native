#include <QQuickMapboxGLStyle>
#include <QQuickMapboxGLProperty>

QQuickMapboxGLStyle::QQuickMapboxGLStyle(QQuickItem *parent)
    : QQuickItem(parent)
{
}

void QQuickMapboxGLStyle::itemChange(QQuickItem::ItemChange change, const QQuickItem::ItemChangeData &value)
{
    QQuickItem::itemChange(change, value);

    switch (change) {
    case QQuickItem::ItemChildAddedChange:
        if (QQuickMapboxGLProperty *property = qobject_cast<QQuickMapboxGLProperty *>(value.item)) {
            connect(property, SIGNAL(updated(QVariantMap)), this, SIGNAL(propertyUpdated(QVariantMap)));
            connect(this, SIGNAL(urlChanged(QString)), property, SLOT(checkUpdated()));
        }
        break;
    case QQuickItem::ItemChildRemovedChange:
        if (QQuickMapboxGLProperty *property = qobject_cast<QQuickMapboxGLProperty *>(value.item)) {
            disconnect(property, SIGNAL(updated(QVariantMap)), this, SIGNAL(propertyUpdated(QVariantMap)));
            disconnect(this, SIGNAL(urlChanged(QString)), property, SLOT(checkUpdated()));
        }
        break;
    default:
        break;
    }
}

void QQuickMapboxGLStyle::setUrl(const QString &url)
{
    if (url == m_url) {
        return;
    }

    m_url = url;
    emit urlChanged(url);
}

QString QQuickMapboxGLStyle::url() const
{
    return m_url;
}
