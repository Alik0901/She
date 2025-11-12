/**
 * Автоматическое включение trust proxy в Express для Railway.
 * Убирает ошибку ValidationError: 'X-Forwarded-For' header ...
 */
module.exports = (app) => {
  app.set('trust proxy', true);
  console.log('✅ Express trust proxy enabled for Railway environment');
};