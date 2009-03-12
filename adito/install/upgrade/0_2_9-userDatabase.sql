ALTER TABLE USERS ADD COLUMN REALM_ID INTEGER DEFAULT 1;

CREATE CACHED TABLE USERS_TMP
(
   USERNAME VARCHAR(255) not null,
   EMAIL VARCHAR(255) not null,
   FULLNAME VARCHAR(255) not null,
   LAST_PASSWORD_CHANGE DATE,
   PASSWORD VARCHAR(100),
   REALM_ID INTEGER
);

INSERT INTO USERS_TMP (USERNAME,EMAIL,FULLNAME,LAST_PASSWORD_CHANGE,PASSWORD,REALM_ID) SELECT * FROM USERS;

DROP TABLE USERS;

CREATE CACHED TABLE USERS
(
   USERNAME VARCHAR(255) not null,
   EMAIL VARCHAR(255) not null,
   FULLNAME VARCHAR(255) not null,
   LAST_PASSWORD_CHANGE DATE,
   PASSWORD VARCHAR(100),
   REALM_ID INTEGER
);

INSERT INTO USERS (USERNAME,EMAIL,FULLNAME,LAST_PASSWORD_CHANGE,PASSWORD,REALM_ID) SELECT * FROM USERS_TMP;

DROP TABLE USERS_TMP;

CREATE UNIQUE INDEX SYS_IDX_USERS_CONSTRAINT_1 ON USERS
(
  USERNAME,
  REALM_ID
);

ALTER TABLE ROLES ADD COLUMN REALM_ID INTEGER DEFAULT 1;

CREATE CACHED TABLE ROLES_TMP
(
   ROLENAME VARCHAR(255) not null,
   REALM_ID INTEGER
);

INSERT INTO ROLES_TMP (ROLENAME,REALM_ID) SELECT * FROM ROLES;

DROP TABLE ROLES;

CREATE CACHED TABLE ROLES
(
   ROLENAME VARCHAR(255) not null,
   REALM_ID INTEGER
);

INSERT INTO ROLES (ROLENAME,REALM_ID) SELECT * FROM ROLES_TMP;

DROP TABLE ROLES_TMP;

CREATE UNIQUE INDEX SYS_IDX_USERS_CONSTRAINT_1 ON ROLES
(
  ROLENAME,
  REALM_ID
);

ALTER TABLE USER_ROLES ADD COLUMN REALM_ID INTEGER DEFAULT 1;

CREATE CACHED TABLE USER_ROLES_TMP
(
   USERNAME VARCHAR(255) not null,
   ROLENAME VARCHAR(255) not null,
   REALM_ID INTEGER
);

INSERT INTO USER_ROLES_TMP (USERNAME,ROLENAME,REALM_ID) SELECT * FROM USER_ROLES;

DROP TABLE USER_ROLES;

CREATE CACHED TABLE USER_ROLES
(
   USERNAME VARCHAR(255) not null,
   ROLENAME VARCHAR(255) not null,
   REALM_ID INTEGER
);

INSERT INTO USER_ROLES (USERNAME,ROLENAME,REALM_ID) SELECT * FROM USER_ROLES_TMP;

DROP TABLE USER_ROLES_TMP;

CREATE UNIQUE INDEX SYS_IDX_USER_ROLES_CONSTRAINT_1 ON USER_ROLES
(
  USERNAME,
  ROLENAME,
  REALM_ID
);

