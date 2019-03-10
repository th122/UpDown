BEGIN { FS=OFS="," }
 { 
   key[NR]=$1;
   tdd[NR]=$3;
   date[NR]=$2;
   if (($1 != key[NR-1]))
        {
          # Starting with the 2nd line,
          # compare the current date with the previous date.
          # If it differs, print the *previous* line.
          if (NR > 1)
          print key[NR-1], date[NR-1], tdd[NR-1]  
        }
    else 
        {
          # same day. we need the larger of the TDDs
          tdd[NR]=(tdd[NR-1]>$3)?tdd[NR-1]:$3;
          # no need to print, that's done on the next iteration!
          # if (tdd[NR] > tdd[NR-1])
          # print key[NR], date[NR], tdd[NR], " <---"
        }
  }
    # last line hasn't been printed yet
END { print key[NR], date[NR], tdd[NR] }
