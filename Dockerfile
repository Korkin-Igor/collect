FROM composer:2 AS composer

FROM php:8.3-cli

ARG APP_USER=app
ARG APP_UID=1000
ARG APP_GID=1000

RUN apt-get update \
    && apt-get install -y --no-install-recommends git unzip zip libzip-dev \
    && docker-php-ext-install zip \
    && groupadd --gid "${APP_GID}" "${APP_USER}" \
    && useradd --uid "${APP_UID}" --gid "${APP_GID}" --create-home --shell /bin/bash "${APP_USER}" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer /usr/bin/composer /usr/local/bin/composer

WORKDIR /app

ENV COMPOSER_HOME=/home/${APP_USER}/.composer
ENV PATH="${COMPOSER_HOME}/vendor/bin:${PATH}"

USER ${APP_USER}

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000", "-t", "/app"]
