# youtubedl-video-to-audio

Youtube video to mp3 audio convert using youtube-dl cli in node.js

## Requirement

- Node.js (>=12)
- Docker (Optional)
- youtube-dl cli

Youtube-dl command : `youtube-dl -x -o 'temp/%(id)s.%(ext)s' -f 'bestaudio' --audio-format 'mp3' https://youtu.be/KlDUtTDm5jY`
