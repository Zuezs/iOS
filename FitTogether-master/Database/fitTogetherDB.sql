DROP TABLE IF EXISTS userInfo;
DROP TABLE IF EXISTS userHealthInfo;
DROP TABLE IF EXISTS authentication;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS badge;
DROP TABLE IF EXISTS badgeType;
DROP TABLE IF EXISTS log;

DROP SCHEMA IF EXISTS fitTogether;

CREATE SCHEMA fitTogether;

CREATE TABLE fitTogether.userInfo (
  phoneNumber       VARCHAR(30),
  name              VARCHAR(30),
  registrationDate  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  discription       VARCHAR(300),

  PRIMARY KEY phoneNumber,
  FOREIGN KEY teamCode REFERENCES fitTogether.team ON UPDATE CASCADE
);

CREATE TABLE fitTogether.userHealthInfo (
  totalSteps        BIGINT,
  dailyGoal         INT,

  FOREIGN KEY phoneNumber REFERENCES fitTogether.userInfo
);

CREATE TABLE fitTogether.userAuthentication (
  phoneNumber       VARCHAR(30),
  passwordHash      CHAR(40) NOT NULL,
  salt              CHAR(40) NOT NULL,

  FOREIGN KEY phoneNumber REFERENCES fitTogether.userInfo
);

CREATE TABLE fitTogether.team (
  teamCode          INT,
  teamName          VARCHAR(30),
  discription       VARCHAR(300),

  PRIMARY KEY teamCode
);

CREATE TABLE fitTogether.badge (
  badgeName         VARCHAR(30),
  discription       VARCHAR(300),
  requirement       BIGINT,
  type              VARCHAR(30),

  PRIMARY KEY badgeName,
  FOREIGN KEY badgeType REFERENCES fitTogether.badgeTypes
);

CREATE TABLE fitTogether.badgeType (
  badgeType         VARCHAR(30),
  discription       VARCHAR(30),

  PRIMARY KEY badgeType
);

CREATE TABLE fitTogether.log (
  logId             SERIAL,
  phoneNumber       VARCHAR(30) NOT NULL REFERENCES fitTogether.userInfo,
  log_date          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  action            VARCHAR(50) NOT NULL
);
