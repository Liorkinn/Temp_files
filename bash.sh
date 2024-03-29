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
PATH = /home/liora/Qt/5.15.2/gcc_64/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/liora/.dotnet/tools
QTDIR = /home/liora/Qt/5.15.2/gcc_64



/home/liora/Qt/5.15.2/gcc_64/bin: - тут файлы такие как assistaint, balsam iconvert linguist xmlpattern and etc...
/usr/bin - qmake как я понял
/usr/local/sbin: пусто
/usr/local/bin пусто 
и тд - это path

/home/liora/Qt/5.15.2/gcc_64 путь к bin там должен быть он а также таам есть папка плагинс - это qtdir

cat test | grep replication | sed 's|#.*||g' | sed '/^$/d' |  awk '{print $4}' >> parse

cat 123 | grep "pg\|zf"

https://sidmid.ru/%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-postgres-9-6-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-%D1%80%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8-master-slave/

Причины, по которым может не работать репликационный сервер PostgreSQL, могут быть разными:

1. Неверно настроенные параметры репликации. Необходимо проверить настройки параметров репликации, такие как max_wal_senders, wal_level и wal_keep_segments.

2. Сбой в сети. Если у вас проблемы с сетью, то репликация не будет работать должным образом. Необходимо проверить соединение между мастером и репликой.

3. Недостаточно системных ресурсов на сервере-реплике. Если ресурсы на сервере-реплике исчерпаны, то репликация может не работать должным образом. Проверьте доступное место на диске, RAM и процессор.

4. Сбой в базе данных. Если мастер-сервер ведет себя непредсказуемо, то репликация может перестать работать. Проверьте журнал ошибок на мастере, чтобы убедиться, что все работало корректно.

5. Неправильно настроена точка входа для реплики. Если вы используете point-in-time recovery (PITR), то проверьте настройки восстановления (recovery.conf) и убедитесь, что они правильно настроены для данной точки в времени.

6. Необходимо перезапустить серверы. Если все эти причины проверены, то возможно, что просто не хватает ресурсов для запуска репликации. Попробуйте перезапустить серверы и повторно настроить репликацию.

git clone git@github.com:zmij/pg_async.git
cd pg_async
mkdir build
cd build
cmake ..
make install
