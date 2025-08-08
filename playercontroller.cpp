#include "playercontroller.h"
#include "audioinfo.h"
#include <QMediaDevices>
#include <QAudioDevice>
#include <QAudioOutput>
#include <QCoreApplication>
#include <QDebug>
#include <QFile>

PlayerController::PlayerController(QObject *parent)
    : QAbstractListModel{parent}
{
    const auto &audioOutputs = QMediaDevices::audioOutputs();
    if (!audioOutputs.isEmpty()) {
        QAudioOutput *m_audioOutput = new QAudioOutput(this);
        m_audioOutput->setVolume(1.0);
        m_mediaplayer.setAudioOutput(m_audioOutput);
    }

    addAudio("Eine Kleine Nachtmusik",
             "Wolfgang Amadeus Mozart",
             QUrl("assets/audio/eine_kleine_nachtmusik.mp3"),
             QUrl("assets/images/song_1.jpg"));

    addAudio("Symphony No. 5",
             "Ludwig Van Beethoven",
             QUrl("assets/audio/symphony_no_5.mp3"),
             QUrl("assets/images/song_2.jpg"));

    addAudio("Air on the F String",
             "Johann Sebastian Bach",
             QUrl("assets/audio/air_on_the_g_string.mp3"),
             QUrl("assets/images/song_3.jpg"));

}

bool PlayerController::playing() const
{
    return m_playing;
}

AudioInfo *PlayerController::currentSong() const
{
    return m_currentSong;
}

void PlayerController::setCurrentSong(AudioInfo *newCurrentSong)
{
    if (m_currentSong == newCurrentSong)
        return;
    m_currentSong = newCurrentSong;
    emit currentSongChanged();

    if(m_currentSong) {
        changeAudioSource(m_currentSong->audioSource());
    } else {
        m_mediaplayer.stop();
        m_mediaplayer.setSource(QUrl());
        m_playing = false;

        emit playingChanged();
    }
}

int PlayerController::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_songList.length();
}

QVariant PlayerController::data(const QModelIndex &index, int role) const
{
    if(index.isValid() && index.row() >= 0 && index.row() < m_songList.length()) {
        AudioInfo *audioInfo = m_songList[index.row()];

        switch((Role) role) {

        case AudioTitleRole:
            return audioInfo->songTitle();
        case AudioAuthorNameRole:
            return audioInfo->songAuthor();
        case AudioSourceRole:
            return audioInfo->audioSource();
        case AudioImageSourceRole:
            return audioInfo->imageSource();
        }
    }

    return {};
}

QHash<int, QByteArray> PlayerController::roleNames() const
{
    QHash<int, QByteArray> result;

    result[AudioTitleRole] = "audioTitle";
    result[AudioAuthorNameRole] = "AudioAuthorName";
    result[AudioSourceRole] = "AudioSource";
    result[AudioTitleRole] = "audioTitle";

    return result;
}

void PlayerController::switchToNextSong()
{
    const int index = m_songList.indexOf(m_currentSong);

    if(index + 1 >= m_songList.length()) {
        setCurrentSong(m_songList.first());
    } else {
        setCurrentSong(m_songList[index + 1]);
    }


}

void PlayerController::switchToPreviousSong()
{
    const int index = m_songList.indexOf(m_currentSong);

    if(index > 0) {
        setCurrentSong(m_songList[index - 1]);
    } else {
        setCurrentSong(m_songList.last());
    }
}

void PlayerController::playPause()
{
    m_playing = !m_playing;
    emit playingChanged();

    if(m_playing) {
        m_mediaplayer.play();
    } else {
        m_mediaplayer.pause();
    }
}

void PlayerController::changeAudioSource(const QUrl &source)
{
    m_mediaplayer.stop();
    m_mediaplayer.setSource(QUrl::fromLocalFile(source.toString()));

    if(m_playing) {
        m_mediaplayer.play();
    }
}

void PlayerController::addAudio(const QString &title, const QString &authorName, const QUrl &audioSource, const QUrl &imageSource)
{
    AudioInfo *newSong = new AudioInfo(this);
    newSong->setSongTitle(title);
    newSong->setSongAuthor(authorName);
    newSong->setAudioSource(audioSource);
    newSong->setImageSource(imageSource);

    if(m_songList.empty()) {
        setCurrentSong(newSong);
        qDebug() << "Song is setted: " + m_mediaplayer.source().toString();
    }

    beginInsertRows(QModelIndex(), m_songList.length(), m_songList.length());
    m_songList << newSong;
    endInsertRows();
}

void PlayerController::removeAudio(int index)
{
    if(index >= 0 && index < m_songList.length()) {
        AudioInfo *toRemove = m_songList[index];

        beginRemoveRows(QModelIndex(), index, index);

        if(toRemove == m_currentSong) {
            if(m_songList.length() > 1) {
                if(index == 0) {
                    setCurrentSong(m_songList[index + 1]);
                } else {
                    setCurrentSong(m_songList[index - 1]);
                }
            } else {
                setCurrentSong(nullptr);
            }
        }

        endRemoveRows();

        m_songList.removeAt(index);
        toRemove->deleteLater();
    }
}
