#!/bin/bash
source /home/superBits/superBitsDevOps/core/coreSBBash.sh
diretorioRaiz=$(pwd)
echo $diretorioRaiz

i=0
while read line
do
arquivos[ $i ]="$line"        
(( i++ ))
done < <(ls  $diretorioRaiz/novoBanco/*.sql )
SQL_NOVO_BANCO="${arquivos[0]}"
echo $SQL_NOVO_BANCO
i=0
while read line
do
arquivos[ $i ]="$line"        
(( i++ ))
done < <(ls  $diretorioRaiz/referencia/*.sql )

SQL_REFERENCIA="${arquivos[0]}"


alerta "a diferenca entre $SQL_REFERENCIA e $SQL_NOVO_BANCO será processada"

mysqladmin -u root -psenhaDev#123 drop BANCO_REFERENCIA -f
mysqladmin -u root -psenhaDev#123 drop BANCO_NOVO_BANCO -f
  	 	
mysql -u root -psenhaDev#123 -e "CREATE DATABASE BANCO_REFERENCIA"
mysql -u root -psenhaDev#123 -e "CREATE DATABASE BANCO_NOVO_BANCO"


echo "Referencia  $SQL_REFERENCIA"
mysql -u root -psenhaDev#123 BANCO_REFERENCIA < $SQL_REFERENCIA
mysql -u root -psenhaDev#123 BANCO_NOVO_BANCO < $SQL_NOVO_BANCO

./dbdiff --config=config.conf --template=templates/simple-db-migrate.tmpl --include=all server1.BANCO_REFERENCIA:server2.BANCO_NOVO_BANCO --output=./resultado.sql
