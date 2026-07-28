# Evolution CMS in Docker

Локальне середовище для Evolution CMS з контейнерами:
- `app` (PHP-FPM 8.3)
- `nginx` (`http://localhost:8080`)
- `db` (MySQL 8, порт `3306`)
- `phpmyadmin` (`http://localhost:8081`)

## 0) Налаштування паролів через .env

1. Скопіюйте приклад:

```bash
copy .env.example .env
```

2. Відредагуйте `.env` (підставте свої значення):

```dotenv
DB_HOST=db
DB_PORT=3306
DB_DATABASE=evolution
DB_USERNAME=evolution
DB_PASSWORD=evolution_pass
MYSQL_ROOT_PASSWORD=root_pass
```

> `docker-compose.yml` читає ці змінні автоматично.

## 1) Перший запуск (через консоль)

```bash
cd C:\Users\User\PhpstormProjects\blog
docker compose up -d --build
```

Перевірити статус:

```bash
docker compose ps
```

Очікувано:
- `evo_app` -> `healthy`
- `evo_db` -> `up`
- `evo_nginx` -> `up`
- `evo_phpmyadmin` -> `up`

Якщо `app` довго в `starting`, дивіться лог установки CMS:

```bash
docker compose logs -f app
```

## 2) Перший запуск (через Docker Desktop)

1. Відкрийте Docker Desktop.
2. Перейдіть у проєкт `C:\Users\User\PhpstormProjects\blog`.
3. Запустіть Compose-стек (`up/build`).
4. Дочекайтесь, поки `app` стане `healthy`.

## 3) Відкрити інсталятор Evolution

- Основна адреса: `http://localhost:8080/`
- Якщо CMS ще не встановлена, інсталятор відкриється з головної автоматично.
- Рекомендований короткий шлях: `http://localhost:8080/setup` (редірект на головну сторінку установки)
- Адмінка після установки: `http://localhost:8080/manager`
- phpMyAdmin: `http://localhost:8081`

## 4) Що вводити в інсталяторі

### Крок "Информация базы данных"

- Тип БД: `MySQL`
- Хост: значення `DB_HOST` (типово `db`)
- Користувач: значення `DB_USERNAME`
- Пароль: значення `DB_PASSWORD`
- Порт: значення `DB_PORT` (типово `3306`)

### Крок "Параметры базы данных"

- Ім'я бази: значення `DB_DATABASE` (типово `evolution`)
- Префікс таблиць: будь-який (наприклад `gaq2_`)
- Collation: `utf8mb4_unicode_ci`

### Крок "Администратор по умолчанию"

- Логін адміна: на ваш вибір (наприклад `admin`)
- Email: ваш email
- Пароль: ваш пароль
- Мова менеджера: `Russian` або `Ukrainian`

### Крок "Дополнительные элементы"

Для стандартного старту можна обрати `Все` і натиснути `Установить`.

## 5) Після успішної установки

1. Відкрийте `http://localhost:8080/manager`.
2. Увійдіть під адмін-користувачем, створеним на кроці установки.

## 6) Корисні команди

Запустити:

```bash
docker compose up -d --build
```

Зупинити:

```bash
docker compose down
```

Зупинити і видалити дані БД (повний reset):

```bash
docker compose down -v
```

Логи:

```bash
docker compose logs -f app
docker compose logs -f nginx
docker compose logs -f db
```

## 7) Типові проблеми

- `502 Bad Gateway`  
  Зазвичай `app` ще ставить CMS. Дочекайтесь завершення в `docker compose logs -f app`.

- `File not found` на `/`  
  Перевірте, що відкриваєте `http://localhost:8080`, а не `http://localhost`.

- `ERR_CONNECTION_REFUSED` при відкритті інсталятора  
  Використайте `http://localhost:8080/setup` або `http://localhost:8080/`. Якщо не допомогло, відкрийте в інкогніто (часто це кеш старого редіректу в браузері).

- `Access denied for user 'evolution'`  
  Переконайтесь, що пароль саме `evolution_pass`.

- Проблеми з collation  
  У проєкті вже встановлено MySQL collation `utf8mb4_unicode_ci` у `docker-compose.yml`.