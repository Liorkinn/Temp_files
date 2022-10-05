#!/bin/bash

case "$1" in

"1" )
echo "select"
;;
"2" )
echo "select $2"
echo $2
;;
"3" )
echo "delete"
echo $2
;;
*)
echo "пусто"
esac
