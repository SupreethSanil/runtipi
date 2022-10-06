#!/usr/bin/env bash
source "${BASH_SOURCE%/*}/common.sh"

ROOT_FOLDER="${PWD}"

kill_watcher
"${ROOT_FOLDER}/scripts/watcher.sh" &
chmod -R a+rwx "${ROOT_FOLDER}/state/events"
chmod -R a+rwx "${ROOT_FOLDER}/state/system-info.json"

docker compose -f docker-compose.dev.yml --env-file "${ROOT_FOLDER}/.env.dev" up --build
