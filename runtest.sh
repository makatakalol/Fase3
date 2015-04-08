#!/bin/bash
# WORKSPACE is set automatically from jenkins prior to executing the script
# TESTNAME has to be set in the jenkins configuration depending on the test
CHECKFILE="$WORKSPACE/results/$TESTNAME.jtl"
RESULTSFILE="$WORKSPACE/results/$TESTNAM_final.jtl"
echo "Using path: $PATH"
echo "Checking if $CHECKFILE exists"
if [ -f "$CHECKFILE" ]
then
rm "$CHECKFILE"
fi
"$WORKSPACE/jmeter/bin/jmeter" -n -t "$WORKSPACE/tests/$TESTNAME.jmx" -l "$WORKSPACE/results/$TESTNAME.jtl" -j "/dev/stdout" -p "$WORKSPACE/jmeter.properties"
# copy this file over to the final file. this can be used for processing by other software
cp "$CHECKFILE" "$RESULTSFILE"