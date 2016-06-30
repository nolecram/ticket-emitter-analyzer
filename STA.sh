#!/bin/bash

LOGFILE="/home/trasf/ALLSELF.STZ"

if [ -f $LOGFILE ]; then
        cut -c6-11 /home/trasf/ALLSELF.STZ > temp1.log
        cut -c12-13 /home/trasf/ALLSELF.STZ > temp2.log
        paste -d , temp1.log temp2.log >> /home/netcool/trenitalia/MonitSTA.log
        rm temp*


	TIMESTAMP=`date +"%Y%m%d%H%M%S"`
        mv $LOGFILE ${LOGFILE}-${TIMESTAMP}
	

#       rm /home/trasf/ALL*
 
fi	
