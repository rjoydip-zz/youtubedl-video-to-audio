const { join, sep } = require("path");
const { spawn } = require("child_process");

(async () => {
  const videoID = "https://youtu.be/KlDUtTDm5jY";
  const temp = join(__dirname, "temp");

  const ytdl = spawn("youtube-dl", [
    "-x",
    "-o",
    `${temp}${sep}%(id)s.%(ext)s`,
    "-f",
    "bestaudio",
    "--audio-format",
    "mp3",
    videoID,
  ]);

  process.stdin.pipe(ytdl.stdin);

  for await (const data of ytdl.stdout) {
    console.log(`ytdl stdout : ${data}`);
  }
  
  if (ytdl.stderr) {
    for await (const data of ytdl.stderr) {
      console.log(`ytdl stderr : ${data}`);
    }
  }
})();
