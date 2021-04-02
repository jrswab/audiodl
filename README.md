**audiodl** is a youtube-dl wrapper which automates the creation, movement, 
and playlist additions when downloading an audio file from a given URL. 
Running **audiodl** with only a URL provided will place the audio file in 
the directory of execution. The resulting MP3 file will consist of  the title 
of the video being converted.

**audiodl** URL [*OPTION*]...

## Installation:
### Add the man page:
`sudo mkdir /usr/local/man/man1`

`sudo cp audiodl.1 /usr/local/man/man1`

`sudo gzip /usr/local/man/man1/audiodl.1`

`sudo mandb`

### Add the script:
`sudo cp audiodl.sh /usr/local/bin/audiodl`
