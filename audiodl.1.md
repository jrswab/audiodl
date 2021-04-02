% audiodl(1) audiodl 0.1.0
% Jaron R. Swab
% April 2021

# NAME
audiodl - A youtube-dl wrapper for downloading audio files.

# SYNOPSIS
**audiodl** URL [*OPTION*]...

# DESCRIPTION
**audiodl** is a youtube-dl wrapper which automates the creation, movement, and playlist additions when downloading an audio file from a given URL. Running **audiodl** with only a URL provided will place the audio file in the directory of execution. The resulting MP3 file will consist of  the title of the video being converted.

# OPTIONS
**-h**, **--help**
: Displays a reference of the options and their usage.

**-n**, **--name**
: The name of the resulting MP3 file. (Wrap in double quotes if spaces are present.)

**-s**, **--separator**
: The character to replace any space with. **-n** or **--name** must be provided.

**-d**, **--directory**
: The directory where the MP3 should be moved to. If not in a parent directory, the absolute path from "/home" must be given.

**-p**, **--playlist**
: The file to place the audio file name in. This file is a new line separated list of file names and must (currently) live in the director with the music. If not in a parent directory, the absolute path from "/home" must be given.

# Examples
**audiodl "https://some.url"**
: Downloads the file, converts it to MP3, and places in the current directory with the default title from youtube-dl.

**audiodl "https://some.url" -n "Some Name"**
: Downloads the file, converts it to MP3, and places in the current directory with the file name "SomeName.mp3".

**audiodl "https://some.url" -n "Some Name" -s "-"**
: Downloads the file, converts it to MP3, and places in the current directory with the file name "Some-Name.mp3".

**audiodl "https://some.url" -n "Some Name" -s "-" -d "/home/audiodl/music/lofi"**
: Downloads the file, converts it to MP3, and places in the lofi directory under "/home/audiodl/music" with the file name "Some-Name.mp3".

**audiodl "https://some.url" -n "Some Name" -s "-" -d "/home/audiodl/music/lofi" -p "/home/audiodl/music/lofi/lofi.playlist**
: Downloads the file, converts it to MP3, places in the lofi directory under "/home/audiodl/music" with the file name "Some-Name.mp3", and adds "Some-Name.mp3" as a new line in "lofi.playlist" under "/home/audiodl/music/lofi".

# EXIT VALUES
**0**
: Success

**1**
: Execution failed, check stderr for information.

# BUGS
I'm sure theres one somewhere...

# COPYRIGHT
Copyright (C) 2021  Jaron R. Swab

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
