#!/bin/bash 

#test OCR
echo "checking OCR service" 
OcrServiceFlag=$(netstat -anp | grep 7080)
if [ x"$OcrServiceFlag" = x ]; then echo "Error !!!!!! OCRService failed, please check!!!!!!!!!!!"; else echo "OCRSERVICE starts successfully"; echo $OcrServiceFlag; fi


#test TTS 
echo "checking TTS service"
TtsServiceFlag=$(netstat -anp | grep 9080)
if [ x"$TtsServiceFlag" = x ]; then echo "Error !!!!! TTSService failed, please check!!!!!!!!"; else echo "TTSSERVICE starts successfully"; echo $TtsServiceFlag; fi


# test linocr
echo "checking Linocr"
linocrFlag=$(netstat -anp | grep 8088)
if [ x"$linocrFlag" = x ]; then echo "Error !!!!!! Java Linocr service failed, please check!!!!!!!!!"; else echo "Java Linocr service starts successfully"; echo $linocrFlag; fi

#test export word
echo "checking export word service"
wordFlag=$(netstat -anp | grep 9001)
if [ x"$wordFlag" = x ]; then echo "Error !!!!!!!! Java word export service failed, please check!!!!!!!!"; else echo "Java word export service starts successfully"; echo $wordFlag; fi

echo "checking recovery service"
logServiceFlag=$(netstat -anp | grep 7235)
if [ x"$logServiceFlag" = x ]; then echo "Error !!!!!! Java Recovery Service failed, please check!!!!!!!!!!"; else echo "Java Recovery Service starts successfully"; echo $logServiceFlag; fi

#test front end existence
echo "checking front end exitence"
index=$(curl http://localhost:8080)
indexLen=$(echo -n $index | wc -c)
if [ x"$indexLen" = x703 ]; then echo "Front end code is in the right place"; else echo "Error !!!! Can not find Front end code!!!!!!!!!"; fi





