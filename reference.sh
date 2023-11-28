#!/bin/bash

REFERENCE_PATH="/mnt/db/ARCHIVE_BASE/archive_base/reference"
DUMP_SQL_PATH="/mnt/db/ARCHIVE_BASE/archive_base/dump_sql"

diff_output=$(diff -r $REFERENCE_PATH $DUMP_SQL_PATH")

# Проверка наличия различий
if [[ -z $diff_output ]]; then
    echo "Скрипты идентичны."
else
    echo "Скрипты различаются:"
    echo "$diff_output"
fi
