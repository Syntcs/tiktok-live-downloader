# TikTok Live Recorder

## Description

The **TikTok Live Recorder** is a Bash script that monitors and records live streams from a specified TikTok user. The script checks the stream's status, retrieves the stream URL, and records the live stream using `ffmpeg`. This script is useful for those who want to save live streams for later viewing or archival purposes.

## Features

- **Stream Status Check:** The script checks if the specified TikTok user is live.
- **URL Retrieval:** Retrieves the direct stream URL using `yt-dlp`.
- **Live Stream Recording:** Records the live stream with `ffmpeg`.
- **Random Filename Generation:** Generates a random filename for the recorded stream.
- **Formatted Output:** Displays start and stop times, filename, file size, and duration of the recording.

## Requirements

Ensure you have the following installed on your system:

- `curl`
  ```bash
  sudo apt install curl
- `yt-dlp`
   ```bash
   sudo apt install ffmpeg
- `ffmpeg`
   ```bash
   pip install yt-dlp

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/Syntcs/tiktok-live-downloader
   cd tiktok_livestream_downloader

2. Make the script executable:
   ```bash
   chmod +x tiktok_livestream_downloader.sh

3. Run the script:
   ```bash
   ./tiktok_livestream_downloader.sh

4. Enter the TikTok username when prompted.
   
![TikTok Live Recorder](https://cdn.discordapp.com/attachments/1245040337827922072/1247620842699886612/image.png?ex=6660b0f4&is=665f5f74&hm=b8c2b6a6010ee8a5f34a7f95eeed307fa4458904f46a84e7f110dca4d5a59465&)

## Author

**TikTok Live Recorder** script by [Syntcs](https://github.com/Syntcs).

- GitHub: [https://github.com/Syntcs](https://github.com/Syntcs)
- Discord: [https://discord.gg/r7pzvU3yWx](https://discord.gg/r7pzvU3yWx)

---

This script is provided as-is, without warranty of any kind. Feel free to contribute and improve it by creating pull requests.
