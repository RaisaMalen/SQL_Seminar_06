# SQL_Seminar_06

## SQL – Транзакции. Временные таблицы, управляющие конструкции, циклы.

### Task_01:

*Создайте функцию, которая принимает количество секунд и форматирует их в количество дней, часов, минут и секунд.\
Пример: 123456 -> '1 days 10 hours 17 minutes 36 seconds'*

### Solution Task_01:
delimiter//
create function times (seconds int)
returns char(15)
deterministic
begin
declare days char(3);
declare hours, minutes, sec char(2);
declare result char(15);
set days = cast(floor(seconds/60/60/24) as char(3));
set hours = cast(floor(mod(seconds/60/60/24,1)*24) as char(2));
set minutes = cast(floor(mod(mod(seconds/60/60/24,1)*24,1)*60) as char(2));
set sec = cast(round(mod(mod(mod(seconds/60/60/24,1)*24,1)*60,1)*60) as char(2));
set result = concat(days, "days", hours, "hours", minutes, "minutes", sec, "seconds");
return result;
end //
delimiter;

### Task_02:

*Выведите только четные числа от 1 до 10.\
Пример: 2, 4, 6, 8, 10*


#### Критерии оценивания: Данная промежуточная аттестация оценивается по системе: "зачет"/ "не зачет". "Зачет" ставится, если слушатель успешно выполнил 1 или 2 задачи. "Не зачет" ставится, если слушатель успешно выполнил 0 задач.
