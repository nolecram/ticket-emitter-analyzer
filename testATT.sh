#!/bin/bash

echo "Insert the Number of the SelfService without "BSS" (501,508,etc.)[ENTER]:"
read SS

echo "The SelfService will be BSS$SS"

TIMESTAMP=`date +"%Y%m%d%H%M%S"`

echo "Insert the Number Of Internet Transaction [ENTER]:"
read IT

echo "Insert the Value Of Internet Transaction [ENTER]:"
read IV

echo "Insert the Number Of POS Transaction [ENTER]:"
read PT
                                                                                
echo "Insert the Value Of POS Transaction [ENTER]:"
read PV
                                                                  
echo "Insert the Number Of Cash Transaction [ENTER]:"
read CT
                                                                                
echo "Insert the Value Of Cash Transaction [ENTER]:"
read CV

echo "Insert the Station for the event (Reggio Calabria C.LE - Roma Termini - Roma Tiburtina - Torino P.N."
read STA

echo "Insert the region for the event (Calabria - Lazio - Piemonte)"
read REG

echo "You are generating a Business Event ($IT,$IV,$PT,$PV,$CT,$CV,$STA,$REG) for the BSS$SS"

echo "BSS$SS,$TIMESTAMP,$IT,$IV,$PT,$PV,$CT,$CV,$STA,$REG,ITALIA" >> MonitATT.log


echo "Done"
 
