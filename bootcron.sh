week_seconds=604800

delta=\
$week_seconds

# next delta = standard delta * 2 - current delta

while read p; do
	pa=~/.timestamps/"$p"

	current_delta=$(( $(date +%s) - $(cat $pa) ))

	#	If there is no timestamp for command $p,
	# or it has been longer than $current_delta seconds

	if [[ ! -e $pa ]] \
		|| (( $current_delta > $delta )); then

		delta=$((2*$week_seconds - $current_delta))

		# Write the new $delta to line 4 of this file
		sed -i '4s/.*/'$delta'/'

		$p
		date +%s > .timestamps/$p;
	fi
	
done<.timestamps/commandlist
