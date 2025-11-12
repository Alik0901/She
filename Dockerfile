# ---------- n8n with proxy trust patch ----------
FROM n8nio/n8n:latest

# Рабочая директория
WORKDIR /data

# Копируем патч trust proxy
COPY patch /data/patch

# Устанавливаем нужные разрешения
RUN chown -R node:node /data

# Загружаем патч при старте
ENV N8N_CUSTOM_EXTENSIONS=/data/patch

# Включаем trust proxy и другие нужные параметры
ENV NODE_ENV=production
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_RUNNERS_ENABLED=true
ENV N8N_GIT_NODE_DISABLE_BARE_REPOS=true
ENV N8N_RATE_LIMIT_DISABLED=true
ENV DB_SQLITE_POOL_SIZE=2
ENV N8N_TRUSTED_PROXIES=*

# Порт Railway
EXPOSE 5678

# Запуск n8n
CMD ["n8n", "start"]