#!/bin/bash

year="\([0-9][0-9][0-9][0-9]\)"
exts="\(aac\|ac3\|h264\|sub\|info\|nfo\|mp4\|mkv\|avi\|iso\|m4v\|wmv\|ogv\|rmvb\|flv\)"
lan="\(hr\|de\|tur\|ro\|pl\|esp\|br\|cz\|nl\|rom\|ger\|slv\|srp\|hun\|cze\|pol\|vie\|rum\|hrv\|ar\|fr\|swe\|eng\|por\|ara\|en\|fra\|fre\|deu\|dan\|ron\|spa\|ell\|fin\|dut\|nor\)"

#This section for movie files

#find directories not ending in a (year), a decade, the word "copy" followed by
# a number, or JACKET_P or VIDEO_TS
#find . -type d -not -regex "\(.*([0-9][0-9][0-9][0-9])\)\|\(.*[0-9][0-9][0-9][0-9]s\)\|\(.*copy[1-9][0-9]*\)\|\(.*JACKET_P\|.*VIDEO_TS\|.*AUDIO_TS\)"



endings="\(($year)\|\( - \(part\|cd\|pt\)[1-9]\)\|\(\(-behindthescenes\|-interview\)[0-9]*\)\)"

#find . -type f -not -regex "\(.*$endings\.\($exts\|\($lan[0-9]*\.\(srt\|sub\)\)\)\)\|\(.*\.\(VOB\|BUP\|IFO\|MP2\)\)"


#This section is for tv show files
#directories
regex=".*\/($year)s\(\|\/[-a-zA-Z, \(\)\'0-9]*\(\|\/Season [1-9][0-9]*\|Specials\)\)"
#find . -type d -not -regex "$regex"


#find . -type d -not -regex ".*\/[0-9][0-9][0-9][0-9]s\(\|\/[-a-zA-Z, \(\)\'0-9]*\(\|\/Season [1-9][0-9]*\|Specials\)\)"
prefix=".*\/"
decade=$year"s"
showname="[-a-zA-Z, \(\)\'0-9]*"
season="Season [1-9][0-9]*\( - .*\)?"
regex="$prefix$decade\(\/$showname\(\/$season\|\/Specials\)?\)?"
find . -type d -not -regex "$regex"


#files
#find . -type f -not -regex ".* - S[0-9][0-9]E[0-9]*\(-E[0-9]*\)?\( - .*\)?\.\(avi\|srt\|mkv\|mp4\)"
