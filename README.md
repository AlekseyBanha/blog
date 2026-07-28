# Evolution CMS — Stand Blog (Docker)

Готовий блог на Evolution CMS 3.

## Швидкий старт

```bash
docker compose up -d --build
```

Дочекатися статусу `healthy` у `evo_app` / `evo_db`:

```bash
docker compose ps
```

Відкрити:

| Що | URL |
|---|---|
| Сайт | http://localhost:8080/ |
| Адмінка | http://localhost:8080/manager |
| phpMyAdmin | http://localhost:8081 |

### Вхід у manager

- **Логін:** `admin`
- **Пароль:** `***********` (запросити)

> Знімок БД лежить у корені: [`database.sql`](./database.sql). MySQL імпортує його **автоматично** під час першого створення volume.

Якщо потрібно перестворити БД з нуля (повторний імпорт знімка):

```bash
docker compose down -v
docker compose up -d --build
```

## Оточення (опційно)

За замовчуванням працюють значення з `docker-compose.yml`. За бажанням:

```bash
copy .env.example .env
```

```dotenv
DB_HOST=db
DB_PORT=3306
DB_DATABASE=evolution
DB_USERNAME=evolution
DB_PASSWORD=evolution_pass
DB_PREFIX=k6on_
MYSQL_ROOT_PASSWORD=root_pass
```

## Стек

- `app` — PHP-FPM 8.3
- `nginx` — http://localhost:8080
- `db` — MySQL 8 (+ автоімпорт `database.sql`)
- `phpmyadmin` — http://localhost:8081

## Корисні команди

```bash
docker compose up -d --build
docker compose ps
docker compose logs -f app
docker compose down
docker compose down -v   # видалити volume БД
```

## Що всередині знімка

- Контент блогу (Home / Blog / пости / About / Contact / слайдер)
- Шаблони, TV, чанки пакета `core/custom/packages/main`
- Адмін `admin` / `***********` (запросити)

Код CMS уже в `src/` (встановлений, маркер `core/.install` на місці). Інсталятор проходити не потрібно.
