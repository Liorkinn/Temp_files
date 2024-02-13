#!/bin/bash

# Функция для проверки работоспособности PostgreSQL
function check_postgresql {
    echo "Проверка работоспособности PostgreSQL..."
    if ! sudo systemctl is-active --quiet postgresql; then
        echo "PostgreSQL не работает."
        return 1
    fi
    echo "PostgreSQL работает."
    return 0
}

# Функция для проверки целостности базы данных
function check_database_integrity {
    echo "Проверка целостности базы данных..."
    if ! pg_dump -s -f /dev/null > /dev/null 2>&1; then
        echo "Ошибка целостности базы данных."
        return 1
    fi
    echo "Целостность базы данных проверена."
    return 0
}

# Функция для проверки наличия проблем с дисковой подсистемой
function check_disk_issues {
    echo "Проверка наличия проблем с дисковой подсистемой..."
    if ! sudo smartctl -a /dev/sda > /dev/null 2>&1; then
        echo "Обнаружены проблемы с дисковой подсистемой."
        return 1
    fi
    echo "Проблемы с дисковой подсистемой не обнаружены."
    return 0
}

# Функция для проверки наличия проблем с оперативной памятью
function check_memory_issues {
    echo "Проверка наличия проблем с оперативной памятью..."
    if ! free -m | grep Mem: | awk '{print $7}' > /dev/null 2>&1; then
        echo "Обнаружены проблемы с оперативной памятью."
        return 1
    fi
    echo "Проблемы с оперативной памятью не обнаружены."
    return 0
}

# Основной блок скрипта
check_postgresql
check_database_integrity
check_disk_issues
check_memory_issues
