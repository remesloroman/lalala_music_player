#ifndef PLAYERCONTROLLER_H
#define PLAYERCONTROLLER_H

#include <QAbstractListModel>
#include <QMediaPlayer>

class AudioInfo;
class PlayerController : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(bool playing READ playing NOTIFY playingChanged)
    Q_PROPERTY(AudioInfo* currentSong READ currentSong WRITE setCurrentSong NOTIFY currentSongChanged)
public:
    enum Role {
        AudioTitleRole = Qt::UserRole + 1,
        AudioAuthorNameRole,
        AudioSourceRole,
        AudioImageSourceRole
    };

    explicit PlayerController(QObject *parent = nullptr);
    bool playing() const;
    AudioInfo *currentSong() const;
    void setCurrentSong(AudioInfo *newCurrentSong);

    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;

signals:
    void playingChanged();
    void currentSongChanged();

public slots:
    void switchToNextSong();
    void switchToPreviousSong();
    void playPause();
    void changeAudioSource(const QUrl &source);
    void addAudio(const QString &title,
                  const QString &authorName,
                  const QUrl &audioSource,
                  const QUrl &imageSource);

    void removeAudio(int index);

private:
    bool m_playing = false;
    AudioInfo *m_currentSong = nullptr;
    QList<AudioInfo*> m_songList;

    QMediaPlayer m_mediaplayer;

};

#endif // PLAYERCONTROLLER_H
