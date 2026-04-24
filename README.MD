# Collect

PHP-библиотека с простым API для работы с коллекциями.

## Требования

- Docker
- Docker Compose

## Что настроено

- `php:8.3-cli` как основной dev-контейнер
- `composer` установлен внутри образа через официальный Docker image `composer:2`
- код проекта монтируется в `/app`
- контейнер запускается от обычного пользователя, чтобы `vendor/` и `composer.lock` не создавались от `root`
- локальный dev-сервер доступен на `http://localhost:10000`

## Быстрый старт

1. При необходимости скорректируйте `.env`.
2. Соберите и поднимите контейнер:

```bash
docker compose up -d --build
```

3. Установите зависимости:

```bash
docker compose exec app composer install
```

4. Проверьте автозагрузку пакета:

```bash
docker compose exec app php index.php
```

5. Откройте в браузере:

```bash
http://localhost:10000
```

## Полезные команды

```bash
docker compose exec app composer validate
docker compose exec app composer dump-autoload
docker compose exec app bash
docker compose down
```

## Публикация на Packagist

Перед публикацией проверьте:

- `composer.json` содержит корректное имя пакета в формате `vendor/package`
- репозиторий доступен по Git URL
- тег версии создан в Git, например `v1.0.0`

После этого пакет можно подключить к Packagist через репозиторий `https://github.com/Korkin-Igor/collect`.
