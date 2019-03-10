!#/bin/sh

# Looking for these lines containing ruffy readout of the Combo history
# 00:59:55.395 [ReadHistoryCommand] DEBUG [ReadHistoryCommand.execute():125]: Wed Jan 30 00:00:00 GMT+01:00 2019: Tdd{timestamp=1548802800000(Wed Jan 30 00:00:00 GMT+01:00 2019), total=38.7}
# reduce to 
# grep Tdd{timestamp 2019-02/AndroidAPS_2019-02-2*  | sed -e "s/.*timestamp=//"
# 1548630000000(Mon Jan 28 00:00:00 GMT+01:00 2019), total=51.9}

# assuming solaris date - other implementations might be using different flags
today=`/bin/date '+%Y-%m-%d'`
# Assuming CEST - insert your local timezone, if this differs!
yesterday=`TZ=CET+24 /bin/date '+%Y-%m-%d'`

#for i in 2019-02/*
logfiles="20*/*"
# logfiles="2019-03/*"
tddtmp="/tmp/tdd-$$.txt"
lib="/home/theuser/sh"

# comb all lines containing TDD information from all logfiles,
# collect into one single file for removal of duplicates.
# leaving in timestamp as key for sorting
:> ${tddtmp}

for i in ${logfiles}
do
  echo " --> gathering $i"
  grep "Tdd{timestamp" $i | sed -e "s/^.*timestamp=//" >> ${tddtmp}
done

echo "found " `wc -l $tddtmp` " lines containing TDD information"

  echo " --> removing lines containing partial data."
  # english -dotted- decimals "1.23"
  # cat ${tddtmp} | sort | uniq | sed -f ${lib}/pumptddhistory2csv.sed | nawk -f ${lib}/comboTDD.awk > comboTDD-${today}.txt
  # german decimals "1,23"
  cat ${tddtmp} | sort | uniq | sed -f ${lib}/pumptddhistory2csv.sed | nawk -f ${lib}/comboTDD.awk | sed -f ${lib}/csv-en2ger.sed  > comboTDD-${today}.txt

/bin/rm ${tddtmp}
echo "Done. Found " `wc -l comboTDD-${today}.txt` " days of TDD information."
echo Now import the comboTDD-${today}.txt into a blank sheet within the the excel worksheet,
echo and copy or reference the TDD entries by their date.
