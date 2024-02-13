#!/bin/bash

# Функция для проверки доступа к БД
check_db_access() {
    psql -c "SELECT 1" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Доступ к БД есть"
    else
        echo "Нет доступа к БД"
    fi
}

# Функция для проверки существования директории БД
check_db_dir() {
    if [ -d "/var/lib/pgsql" ]; then
        echo "Директория БД существует"
    else
        echo "Директории БД не существует"
    fi
}

# Функция для проверки места на диске в разделе БД
check_db_disk_space() {
    DISK_SPACE=$(df -h /var/lib/pgsql | awk 'NR==2 {print $4}')
    echo "Свободное место на диске в разделе БД: $DISK_SPACE"
}

# Функция для проверки ошибок раздела с БД
check_db_partition_errors() {
    FS_ERRORS=$(dmesg | grep -i postgres | grep -i error)
    if [ -z "$FS_ERRORS" ]; then
        echo "Ошибок в разделе БД нет"
    else
        echo "Обнаружены ошибки в разделе БД:"
        echo "$FS_ERRORS"
    fi
}

# Функция для вывода pg_hba.conf в лог-файл
output_pg_hba_conf() {
    echo "Содержимое pg_hba.conf:"
    cat /var/lib/pgsql/pg_hba.conf
}

# Функция для вывода postgresql.conf в лог-файл
output_postgresql_conf() {
    echo "Содержимое postgresql.conf:"
    cat /var/lib/pgsql/postgresql.conf
}

# Функция для проверки статуса службы PostgreSQL
check_db_service_status() {
    service postgresql status
}

# Функция для проверки версии PostgreSQL
check_db_version() {
    psql -V
}

# Функция для проверки активных подключений к БД
check_db_active_connections() {
    psql -c "SELECT count(*) FROM pg_stat_activity WHERE state = 'active';"
}

# Функция для проверки наличия заблокированных транзакций
check_db_locked_transactions() {
    psql -c "SELECT * FROM pg_locks WHERE granted = 'f';"
}

# Функция для проверки наличия ошибок в журнале ошибок PostgreSQL
check_db_error_log() {
    grep "ERROR:" /var/lib/pgsql/data/pg_log/postgresql-*.log
}

# Вызов функций и запись результатов в лог-файл
check_db_access >> /tmp/database.log
check_db_dir >> /tmp/database.log
check_db_disk_space >> /tmp/database.log
check_db_partition_errors >> /tmp/database.log
output_pg_hba_conf >> /tmp/database.log
output_postgresql_conf >> /tmp/database.log
check_db_service_status >> /tmp/database.log
check_db_version >> /tmp/database.log
check_db_active_connections >> /tmp/database.log
check_db_locked_transactions >> /tmp/database.log
check_db_error_log >> /tmp/database.log
