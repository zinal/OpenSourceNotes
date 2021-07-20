CREATE ROLE scm LOGIN PASSWORD 'P@ssw0rd';
CREATE ROLE rman LOGIN PASSWORD 'P@ssw0rd';
CREATE ROLE hue LOGIN PASSWORD 'P@ssw0rd';
CREATE ROLE hive LOGIN PASSWORD 'P@ssw0rd';
CREATE ROLE oozie LOGIN PASSWORD 'P@ssw0rd';
CREATE ROLE das LOGIN PASSWORD 'P@ssw0rd';
CREATE ROLE schemaregistry LOGIN PASSWORD 'P@ssw0rd';
CREATE ROLE smm LOGIN PASSWORD 'P@ssw0rd';

GRANT scm TO admin;
GRANT rman TO admin;
GRANT hue TO admin;
GRANT hive TO admin;
GRANT oozie TO admin;
GRANT das TO admin;
GRANT schemaregistry TO admin;
GRANT smm TO admin;

CREATE USER rangeradmin WITH PASSWORD 'P@ssw0rd';
GRANT rangeradmin TO admin;
