#!/bin/sh
set -eu

APP_DIR="/var/www/html"
EVO_VERSION="${EVO_VERSION:-3.5.x-dev}"

fix_permissions() {
  mkdir -p "${APP_DIR}/assets/cache/rss"
  mkdir -p "${APP_DIR}/core/config/database/connections"
  mkdir -p "${APP_DIR}/core/storage/logs"
  mkdir -p "${APP_DIR}/core/storage/sessions"
  mkdir -p "${APP_DIR}/core/storage/cache"
  mkdir -p "${APP_DIR}/core/storage/blade"
  mkdir -p "${APP_DIR}/core/storage/bootstrap"
  mkdir -p "${APP_DIR}/views"

  # Make installer/runtime paths writable for php-fpm user.
  chown -R www-data:www-data \
    "${APP_DIR}/assets" \
    "${APP_DIR}/install" \
    "${APP_DIR}/views" \
    "${APP_DIR}/core/config/database/connections" \
    "${APP_DIR}/core/storage" 2>/dev/null || true
  chmod -R ug+rwX \
    "${APP_DIR}/assets" \
    "${APP_DIR}/install" \
    "${APP_DIR}/views" \
    "${APP_DIR}/core/config/database/connections" \
    "${APP_DIR}/core/storage" 2>/dev/null || true
  chmod -R 0777 "${APP_DIR}/assets/cache" "${APP_DIR}/views" 2>/dev/null || true
}

if [ ! -f "${APP_DIR}/composer.json" ]; then
  # If previous install was interrupted, remove known safe leftovers.
  rm -f "${APP_DIR}/.gitkeep"
  if [ -d "${APP_DIR}/vendor" ]; then
    echo "Removing incomplete vendor directory from previous attempt..."
    rm -rf "${APP_DIR}/vendor"
  fi
  rm -f "${APP_DIR}/composer.lock"

  # Refuse only when user files are present and composer.json is still missing.
  if find "${APP_DIR}" -mindepth 1 | read -r _; then
    echo "Directory ${APP_DIR} contains files but composer.json is missing."
    echo "Refusing auto-install to avoid overwriting existing project files."
    exit 1
  fi

  echo "Evolution CMS not found. Installing version ${EVO_VERSION}..."
  composer create-project "evolutioncms/evolution:${EVO_VERSION}" "${APP_DIR}" --remove-vcs
  echo "Evolution CMS installation completed."
else
  echo "Existing project detected. Skipping create-project."
fi

fix_permissions

exec "$@"