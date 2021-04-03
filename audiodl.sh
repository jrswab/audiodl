#!/bin/sh

# AudioDL is a wrapper for Youtube-DL and aims to automate the process of
# downloading audio only files, moving them to a desired directory, and
# adding them to a playlist.
# Copyright (C) 2021  Jaron R. Swab
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

name=""
dir=""
playlist=""
url=""
sep=""
helpr='
audiodl.sh URL [OPTIONS]

OPTIONS:
 -n The name of the resulting audio file.
 -s The separator for the given name. (Defaults to no separation. ie: SomeSong)
    (If no name is given this option is ignored.)
 -d The path to the desired directory.
    (Must be an absolute path if not in a parent directory.)
 -p The path to the desired playlist file.
    (Must be an absolute path if not in a parent directory.)
'


for arg in "$@"; do
	is_url=$(echo "$arg" | sed 's/http.*/true/g')
	if [ "$is_url" = "true" ]; then
		url="$arg"
		shift # shifts argument numeration. "Removes" and argument once processed.
		continue
	fi

	case $arg in
		-h|--help)
			printf '"%s"' "$helpr"
			exit 0;
			;;
		-n|--name)
			name="$2"
			shift
		;;
		-s|--separator)
			sep="$2"
			shift
			;;
	  -d|--directory)
			dir="$2"
			shift
		;;
		-p|--playlist)
			playlist="$2"
			shift
		;;
		*)
			shift
			continue
		;;
	esac
done

if [ "$name" = "" ]; then
	youtube-dl -x --audio-format "mp3" --audio-quality 0 --embed-thumbnail -o '%(title).%(ext)s' "$url"
else
	name=$(echo "$name" | sed "s/ /$sep/g")
	youtube-dl -x --audio-format "mp3" --audio-quality 0 --embed-thumbnail -o "$name"'.%(ext)s' "$url"
fi

if [ "$dir" != "" ]; then
	if [ "$name" = "" ]; then
		printf '[audiodl] To move the resulting audio file to the provided directory; "-n" must be given.\n'
		exit 1;
	fi
	mv "$name".mp3 "$dir" && \
		printf '[audiodl] "%s" successfully moved to "%s"\n' "$name" "$dir";
fi

if [ "$playlist" != "" ]; then
	if [ "$name" = "" ]; then
		printf '[audiodl] To add the resulting audio file to the provided playlist; "-n" must be given.\n'
		exit 1;
	fi
	echo "$name".mp3 >> "$playlist" && \
		printf '[audiodl] "%s" successfully added to "%s"\n' "$name" "$playlist";
fi

exit 0;
