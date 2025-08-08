#ifndef AUDIOINFO_H
#define AUDIOINFO_H

#include <QObject>
#include <QQmlEngine>

class AudioInfo : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(int songIndex READ songIndex WRITE setSongIndex NOTIFY songIndexChanged REQUIRED)
    Q_PROPERTY(QString songTitle READ songTitle WRITE setSongTitle NOTIFY songTitleChanged)
    Q_PROPERTY(QString songAuthor READ songAuthor WRITE setSongAuthor NOTIFY songAuthorChanged)
    Q_PROPERTY(QUrl imageSource READ imageSource WRITE setImageSource NOTIFY imageSourceChanged)
    Q_PROPERTY(QUrl audioSource READ audioSource WRITE setAudioSource NOTIFY audioSourceChanged REQUIRED)
public:
    explicit AudioInfo(QObject *parent = nullptr);

    int songIndex() const;
    void setSongIndex(int newSongIndex);

    QString songTitle() const;
    void setSongTitle(const QString &newSongTitle);

    QString songAuthor() const;
    void setSongAuthor(const QString &newSongAuthor);

    QUrl imageSource() const;
    void setImageSource(const QUrl &newImageSource);

    QUrl audioSource() const;
    void setAudioSource(const QUrl &newAudioSource);

signals:
    void songIndexChanged();
    void songTitleChanged();

    void songAuthorChanged();

    void imageSourceChanged();

    void audioSourceChanged();

private:
    int m_songIndex;
    QString m_songTitle;
    QString m_songAuthor;
    QUrl m_imageSource;
    QUrl m_audioSource;
};

#endif // AUDIOINFO_H
