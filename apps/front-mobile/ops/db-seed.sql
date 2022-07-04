-- ext
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create postgre databases
--- Auth server user
CREATE USER "auth_user";
ALTER USER auth_user WITH PASSWORD 'pass';
CREATE DATABASE "auth_server" ENCODING 'UTF8' LC_COLLATE = 'en-US' LC_CTYPE = 'en-US' TEMPLATE template0;
GRANT ALL PRIVILEGES ON DATABASE auth_server TO "auth_user";
