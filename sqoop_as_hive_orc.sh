#!/bin/sh 
#==================================================================================#
#							SNP SQOOP SHELL SCRIPT								   #
#	author zhaozihe 			from jiuqi				date 2017-3-10 17:50:25    #
#==================================================================================#
#$1 TABLE THAT WANT TO IMPORT
#$2 IS INCREAMENT
#$3	INCREAMENT IMPORT LAST COLUMN

#UPDATE PROCESS = 0%
echo "0" > process.temp
#=============0%===============#
TABLE_TO=$1
TABLE_SUFFIX="_t"
TEMP_TABLE=${TABLE_TO}${TABLE_SUFFIX}

echo $TEMP_TABLE
echo "[SNP-SQOOP-INFO]== Sqoop executing, please wait a moment!! ==[SNP-SQOOP-INFO]"
echo "10" > process.temp
#===========10%=================#

sqoop import --hive-import --hive-overwrite --connect jdbc:oracle:thin:@10.2.32.1:1521:orcl --username SNP --password SNP --verbose -m 1 --hive-table $TEMP_TABLE --table $TABLE_TO  --map-column-hive RECID=STRING,UNITID=STRING 2>sqoop.tmp
echo "[SNP-SQOOP-INFO]== Sqoop Completed!! ==[SNP-SQOOP-INFO]"
echo "50" > process.temp
#===========50%=================#

CREATE_STATMENT=`echo |awk '/Create statement/' sqoop.tmp`
#echo $CREATE_STATMENT
PREFIX_STATEMENT=${CREATE_STATMENT#*Create statement:}
#echo $PREFIX_STATEMENT
TABLE_CHANGE=${PREFIX_STATEMENT/_t/}
ORC_CREATE_STATEMENT=${TABLE_CHANGE/TEXTFILE/ORC}
INSERT_STATEMENT_PREFIX="INSERT INTO TABLE "${TABLE_TO}" SELECT "
DROP_STATEMENT="DROP TABLE "${TEMP_TABLE}
SHOW_STATEMENT="show tables;"

#ORC_CREATE_STATEMENT_T1=${ORC_CREATE_STATEMENT//\\/\\\\}
#ORC_CREATE_STATEMENT_T2=${ORC_CREATE_STATEMENT_T1//\//\\\\/}
#ORC_CREATE_STATEMENT_T3=${ORC_CREATE_STATEMENT_T2//\`/\\\`}
#ORC_CREATE_STATEMENT_E=${ORC_CREATE_STATEMENT_T3//\'/\\\'}

echo $ORC_CREATE_STATEMENT > create.hql
echo ";" >> create.hql

echo $INSERT_STATEMENT_PREFIX >> create.hql
echo "*" >>create.hql
echo " FROM "${TEMP_TABLE} >> create.hql
echo ";" >>create.hql

echo $DROP_STATEMENT >>create.hql
echo ";" >>create.hql

echo $SHOW_STATEMENT >>create.hql
echo "70" > process.temp
#===========70%=================#
#ORC_CREATE_STATEMENT_L=`echo |awk '/CREATE TABLE IF NOT EXISTS /' create.hiveql.tmp`
hive -f create.hql
#"CREATE TABLE IF NOT EXISTS "${ORC_CREATE_STATEMENT_L}";"
echo "[SNP-SQOOP-INFO]== ORC file Created! ==[SNP-SQOOP-INFO]"

#hive -e $INSERT_STATEMENT";"
echo "[SNP-SQOOP-INFO]== ORC file imported! ==[SNP-SQOOP-INFO]"

#hive -e "DROP TABLE"${TEMP_TABLE}";"
echo "[SNP-SQOOP-INFO]== Temp table droped! ==[SNP-SQOOP-INFO]"

#hive -e "show tables;"
echo "[SNP-SQOOP-INFO]== Mission completed! ==[SNP-SQOOP-INFO]"
echo "100" > process.temp
#===========70%=================#