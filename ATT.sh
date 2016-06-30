#!/bin/bash
 
SHARED="/home/trasf/"
#LOGFILE="pippo.log"

for LOGFILE in `ls /home/trasf/BSS*log`; do
 
        echo $LOGFILE > codice.dat
        #touch $SHARED$LOGFILE
        #CODICE=`sed "s/.*\(BSS\d\d\d\).*\.log/\1/" ./codice.dat`
        CODICE=`cut -c13-18 ./codice.dat`
        #cut -c13-18 ./codice.dat > codiceSS
        echo $CODICE


	#if [ -f $LOGFILE ]; then
        #touch ${LOGFILE}${TIMESTAMP}
 
        cat $LOGFILE | grep 'PAGAMENTO POS' > tmp1.log
        # Estrae Importi e Numero Operazioni Buon Fine POS

	cat $LOGFILE | grep 'Tramite POS' > tmp2.log
        # Estrae Importi e numero operazioni Totali POS
                                                                                
        cat $LOGFILE | grep 'NumeroBanconoteDaEmettere' > tmp3.log
        # Estrae Numero Operazioni Contanti a Buon Fine	

	cat $LOGFILE | grep 'PENTIMENTO' > tmp4.log
        # [pentimento.log - (totalepos.log - carte.log)] = Contanti non concluse
                                                                                
                                                                                
        cat $LOGFILE | grep  'PC-MONEY: I' > tmp5.log
        # Contiene tutte le transazioni con quelle POS e Int in doppia riga
                                                                                
        cat tmp5.log | grep 'NSA' > tmp6.log
        cat tmp6.log | grep -B 1 '^ ' > tmp7.log
        cat tmp7.log | grep 'IMPORTO' > tmp8.log
        # Estrae numero e valore transazioni Internet

	awk 'END {print NR}' tmp8.log > tmp9.log
        awk '/INIZIO/ {valore +=$11} END {print valore}' tmp8.log > tmp10.log
        # tmp9.log = Num Trans Int tmp10.log = Val Trans Int
        awk 'END {print NR}' tmp1.log > tmp11.log
        awk '/GESTORE/ {valore +=$11} END {print valore}' tmp1.log > tmp12.log
        # tmp11.log = Num Trans POS tmp12 = Val Trans POS
        awk 'END {print NR}' tmp3.log > tmp13.log
        cat tmp5.log | grep -B 1 '^ ' > tmp20.log
        diff tmp5.log tmp20.log > tmp21.log
	awk '/GESTORE/ {valore +=$12} END {print valore}' tmp21.log > tmp14.log
        # tmp13.log = Num Trans Cash OK tmp14.log = Val Tran Cash Tot
        echo $CODICE > tmp22.log
        date +"%H%M%S" > tmp23.log
        PIPPO=`paste -d , tmp22.log tmp23.log tmp9.log tmp10.log tmp11.log tmp12.log tmp13.log tmp14.log`
	echo $PIPPO,Roma Termini,Lazio,ITALIA >> /home/netcool/trenitalia/MonitATT.log
	# "Cod SS, Date, Trans Int, Val Int,Trans POS, Val POS, TRans Cash, Val Cash"
	

	rm tmp*
                                                                                   
        # rinomina e archivia il file elaborato
                                                                                   
        TIMESTAMP=`date +"%Y%m%d%H%M%S"`
        mv $LOGFILE ${LOGFILE}${TIMESTAMP}

done

#fi
