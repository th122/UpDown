s/.*timestamp=//
s/(/,/g
s/), total=/,/g
s/}//
s/ 00:00:00 GMT+01:00//
s/ 00:00:00 GMT+02:00//
s/... Jan \(..\) /01\/\1\//
s/... Feb \(..\) /02\/\1\//
s/... Mar \(..\) /03\/\1\//
s/... Apr \(..\) /04\/\1\//
s/... May \(..\) /05\/\1\//
s/... Jun \(..\) /06\/\1\//
s/... Jul \(..\) /07\/\1\//
s/... Aug \(..\) /08\/\1\//
s/... Sep \(..\) /09\/\1\//
s/... Oct \(..\) /10\/\1\//
s/... Nov \(..\) /11\/\1\//
s/... Dec \(..\) /12\/\1\//
