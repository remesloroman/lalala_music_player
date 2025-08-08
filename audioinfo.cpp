#include "audioinfo.h"

AudioInfo::AudioInfo(QObject *parent)
    : QObject{parent}
{}

int AudioInfo::songIndex() const
{
    return m_songIndex;
}

void AudioInfo::setSongIndex(int newSongIndex)
{
    if (m_songIndex == newSongIndex)
        return;
    m_songIndex = newSongIndex;
    emit songIndexChanged();
}

QString AudioInfo::songTitle() const
{
    return m_songTitle;
}

void AudioInfo::setSongTitle(const QString &newSongTitle)
{
    if (m_songTitle == newSongTitle)
        return;
    m_songTitle = newSongTitle;
    emit songTitleChanged();
}

QString AudioInfo::songAuthor() const
{
    return m_songAuthor;
}

void AudioInfo::setSongAuthor(const QString &newSongAuthor)
{
    if (m_songAuthor == newSongAuthor)
        return;
    m_songAuthor = newSongAuthor;
    emit songAuthorChanged();
}

QUrl AudioInfo::imageSource() const
{
    return m_imageSource;
}

void AudioInfo::setImageSource(const QUrl &newImageSource)
{
    if (m_imageSource == newImageSource)
        return;
    m_imageSource = newImageSource;
    emit imageSourceChanged();
}

QUrl AudioInfo::audioSource() const
{
    return m_audioSource;
}

void AudioInfo::setAudioSource(const QUrl &newAudioSource)
{
    if (m_audioSource == newAudioSource)
        return;
    m_audioSource = newAudioSource;
    emit audioSourceChanged();
}
