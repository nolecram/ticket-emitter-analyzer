#!/bin/bash

echo "Insert the Number of the SelfService without "BSS" (501,508,etc.)[ENTER]:"
read SS

echo "The SelfService will be BSS$SS"

echo "Insert the Event Code to be generated (10 - OK) (20,21,22,40 - KO) [ENTER]:"
read EV

echo "You are generating Event $EV for the BSS$SS"

echo "BSS$SS,$EV" >> MonitSTA.log


echo "Done"
 
