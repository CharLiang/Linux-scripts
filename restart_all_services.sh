#!/bin/bash
# nginx server
echo "checking nginx server"
nginxFlag=$(service nginx status |grep not)
if [ x"$nginxFlag" = x ]; then
  echo "nginx server is running";
  echo $nginxFlag;
else
 echo "Error !!!!!! nginx server is down";
 service nginx restart
 sleep 5
fi

#mysql server
echo "checking myaql server"
sqlFlag=$(service mysql.server status |grep not)
if [ x"$nginxFlag" = x ]; then
  echo "nginx server is running";
  echo $nginxFlag;
else
 echo "Error !!!!!! mysql server is down";
 chmod -R 755 /usr/local/mysql/data
 service nginx restart
 sleep 5
fi

#  OCR
echo "checking OCR service"
OcrServiceFlag=$(netstat -anp | grep 7080 | grep OCR)
if [ x"$OcrServiceFlag" = x ]; then
 echo "Error !!!!!! OCRService failed";
 sh stop_ocrservice.sh ;
 sh start_ocrservice.sh ; 
 sleep 20
else
   echo "OCRSERVICE starts successfully";
   echo $OcrServiceFlag;
fi


# TTS
echo "checking TTS service"
TtsServiceFlag=$(netstat -anp | grep 9080 | grep TTSService)
if [ x"$TtsServiceFlag" = x ]; then
   echo "Error !!!!! TTSService failed, please check!!!!!!!!";
   sh stop_ttsservice.sh;
   sh start_ttsservice.sh;
   sleep 20
else
  echo "TTSSERVICE starts successfully";
  echo $TtsServiceFlag;
fi


# linocr service
echo "checking Linocr"
linocrFlag=$(netstat -anp | grep :8088 | grep java)
if [ x"$linocrFlag" = x ];
then
  echo "Error !!!!!! Java Linocr service failed, please check!!!!!!!!!";
  cd /home/linhui/workspace/aidisk/web-service
  sh stop.sh
  sh start.sh
  sleep 20
 else echo "Java Linocr service starts successfully"; echo $linocrFlag; fi

# export word
echo "checking export word service"
wordFlag=$(netstat -anp | grep :9001)
if [ x"$wordFlag" = x ];
 then
   echo "Error !!!!!!!! Java word export service failed, please check!!!!!!!!";
   cd /home/linhui/workspace/aidisk/dict-xinhua
   sh stop.sh
   sh start.sh
   sleep 20
 else echo "Java word export service starts successfully"; echo $wordFlag; fi


# recovery service
echo "checking recovery service"
logServiceFlag=$(netstat -anp | grep :7235)
if [ x"$logServiceFlag" = x ];
   then
      echo "Error !!!!!! Java Recovery Service failed, please check!!!!!!!!!!";
      cd /home/linhui/workspace/aidisk/log-server/code
      source /etc/profile
      gradle shutdown
      gradle start
      sleep 20
 else echo "Java Recovery Service starts successfully"; echo $logServiceFlag; fi








