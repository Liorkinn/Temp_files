1.Для вывода списка последовательностей, привязанных к автоинкрементным 
полям в PostgreSQL, можно использовать следующий SQL-запрос:

SELECT DISTINCT pg_class.relname
FROM pg_class 
JOIN pg_attribute ON pg_attribute.attrelid = pg_class.oid
JOIN pg_attrdef ON pg_attrdef.adrelid = pg_class.oid AND pg_attrdef.adnum = pg_attribute.attnum
WHERE pg_attribute.atttypid = 'pg_catalog.int4'::regtype 
AND pg_attrdef.adsrc LIKE 'nextval(%' AND pg_class.relkind = 'r';

2. Команды вакуумирования postgresql
Вакуумирование базы данных Postgresql нужно выполнять регулярно, чтобы уменьшить размеры базы данных и улучшить ее производительность. Вот некоторые команды для вакуумирования Postgresql:
1. VACUUM ANALYZE: Эта команда выполняет вакуумирование таблицы и анализ ее структуры, чтобы оптимизировать производительность запросов.
2. VACUUM FULL: Эта команда выполняет более глубокое вакуумирование таблицы и освобождает все неиспользуемые блоки, чтобы ее размер уменьшается.
3. VACUUM FREEZE: Эта команда выполняет вакуумирование таблицы и замораживает все строки, чтобы они не могли быть изменены или удалены.
4. REINDEX: Эта команда перестраивает индексы таблицы, чтобы улучшить ее производительность.
5. CLUSTER: Эта команда переупорядочивает данные в таблице для улучшения производительности запросов.
6. ANALYZE: Эта команда анализирует структуру таблицы и обновляет статистику базы данных, которая используется оптимизатором запросов.

1. VACUUM FULL:
Эта команда освобождает пространство, занимаемое удаленными строками. 
Пример синтаксиса:
```SQL
VACUUM FULL;
```

2. VACUUM ANALYZE:
Эта команда анализирует данные таблицы, обновляя статистику, необходимую для оптимального выполнения запросов.
Пример синтаксиса:
```SQL
VACUUM ANALYZE mytable;
```

3. VACUUM FREEZE:
Эта команда "замораживает" вакуумирование всех строк в таблице, чтобы избежать дополнительного сбора мусора в будущем.
Пример синтаксиса:
```SQL
VACUUM FREEZE mytable;
```

4. VACUUM VERBOSE:
Эта команда отображает подробную информацию о процессе вакуумирования, включая количество удаленных строк и освобожденное пространство.
Пример синтаксиса:
```SQL
VACUUM VERBOSE mytable;
```

5. VACUUM FULL VERBOSE ANALYZE:
Команда вакуумирует всю таблицу, удаляя строку для освобождения пространства, сбрасывая журнал и обновляя статистику.
Пример синтаксиса:
```SQL
VACUUM FULL VERBOSE ANALYZE mytable;
```

3. Создание резервных копий БД.
pg_dump mydatabase > mydatabase_dump.sql

1. Резервирование базы данных PostgreSQL в файл:

pg_dump -Fc mydatabase > mydatabase.dump

2. Резервирование базы данных без сжатия:

pg_dump -Fp mydatabase > mydatabase.sql

3. Резервирование базы данных с отключением триггеров:

pg_dump -Fc -t mytable -T mytrigger mydatabase > mydatabase.dump

4. Резервирование базы данных только определенного схемы:

pg_dump -Fc -n myschema mydatabase > myschema.dump

5. Резервирование базы данных только определенных таблиц:

pg_dump -Fc -t mytable1 -t mytable2 mydatabase > mytables.dump

6. Резервирование базы данных с опцией исключения:

pg_dump -Fc -E UTF-8 -T mytable mydatabase > mydatabase.dump

7. Резервирование базы данных с опцией сжатия:

pg_dump -Fc -z mydatabase > mydatabase.dump.gz

8. Резервирование базы данных с созданием новой базы данных:

pg_dump -Fc mydatabase | psql -h host -p port -U username -d newdatabase

9. Резервирование базы данных с использованием пароля:

pg_dump -Fc -h host -p port -U username -W mydatabase > mydatabase.dump

10. Резервирование базы данных с использованием SSL:

pg_dump -Fc -h host -p port -U username --sslmode require mydatabase > mydatabase.dump

https://drive.google.com/file/d/1kfjxQ7TzxwgStjHiR_S94t79jPlln8VW/view?usp=sharing
