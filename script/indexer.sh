#! /bin/sh

printf "Indexing bg\n";

START_TIME=$SECONDS

sh terrier_index.sh -l bg -c bg_ah_mono_0507

ELAPSED_TIME=$(($SECONDS - $START_TIME))

printf "required time: " 
echo ELAPSED_TIME;

printf "Indexing TREC\n";

printf "Indexing de_ah_mono_0000\n";

START_TIME=$SECONDS

sh terrier_index.sh -l de -c de_ah_mono_0000

printf "required time: " 
echo ELAPSED_TIME;

printf "Indexing de_ah_rob_mono_0106\n";

START_TIME=$SECONDS


sh terrier_index.sh -l de -c de_ah_rob_mono_0106

printf "required time: " 
echo ELAPSED_TIME;

printf "Indexing enCLEF0306\n";

START_TIME=$SECONDS

sh terrier_index.sh -l enCLEF -c en_ah_mono_0306

ELAPSED_TIME=$(($SECONDS - $START_TIME))

printf "required time: " 
echo ELAPSED_TIME;

printf "Indexing enCLEF0707\n";

START_TIME=$SECONDS

sh terrier_index.sh -l enCLEF -c en_ah_mono_0707

ELAPSED_TIME=$(($SECONDS - $START_TIME))

printf "required time: " 
echo ELAPSED_TIME;


printf "Indexing es_ah_mono_0102\n";

START_TIME=$SECONDS


sh terrier_index.sh -l es -c es_ah_mono_0102

printf "required time: " 
echo ELAPSED_TIME;

printf "Indexing es_ah_rob_mono_0306\n";

START_TIME=$SECONDS


sh terrier_index.sh -l es -c es_ah_rob_mono_0306

printf "required time: " 
echo ELAPSED_TIME;

printf "Indexing fi_ah_mono_0204\n";

START_TIME=$SECONDS


sh terrier_index.sh -l fi -c fi_ah_mono_0204

printf "required time: " 
echo ELAPSED_TIME;

printf "Indexing fr_ah_mono_0000\n";

START_TIME=$SECONDS


sh terrier_index.sh -l fr -c fr_ah_mono_0000

printf "required time: " 
echo ELAPSED_TIME;

printf "Indexing fr_ah_mono_0102\n";

START_TIME=$SECONDS


sh terrier_index.sh -l fr -c fr_ah_mono_0102

printf "required time: " 
echo ELAPSED_TIME;

printf "Indexing fr_ah_mono_0404\n";

START_TIME=$SECONDS


sh terrier_index.sh -l fr -c fr_ah_mono_0404

printf "required time: " 
echo ELAPSED_TIME;

printf "Indexing fr_ah_mono_0506\n";

START_TIME=$SECONDS

