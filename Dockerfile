# Базовый образ n8n
FROM n8nio/n8n:latest

# Рабочая директория
WORKDIR /home/node

# Копируем патч для trust proxy (если есть)
COPY patch /home/node/patch

# Включаем trust proxy и рекомендуемые переменные
ENV NODE_ENV=production
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_RUNNERS_ENABLED=true
ENV N8N_GIT_NODE_DISABLE_BARE_REPOS=true
ENV N8N_RATE_LIMIT_DISABLED=true
ENV DB_SQLITE_POOL_SIZE=2
ENV N8N_TRUSTED_PROXIES=*
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

# Гарантируем сохранение данных в стандартной директории n8n
VOLUME ["/home/node/.n8n"]

# Указываем Railway порт
EXPOSE 5678

# Запускаем как пользователь node (иначе нет прав на /home/node)
USER node

# Команда запуска
ENTRYPOINT ["n8n"]
