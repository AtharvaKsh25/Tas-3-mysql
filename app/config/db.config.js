module.exports = {
  HOST: "172.31.24.90",
  USER: "appuser",
  PASSWORD: "App@123",
  DB: "bezkoder_db",
  dialect: "mysql",
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
};
