ALTER TABLE app_configuration ALTER COLUMN frontend_dirroot SET DEFAULT '/app/';
ALTER TABLE app_configuration ALTER COLUMN api_dirroot SET DEFAULT '/app/';
ALTER TABLE app_configuration ALTER COLUMN cron_dirroot SET DEFAULT '/app/';
ALTER TABLE app_configuration ALTER COLUMN backstage_dirroot SET DEFAULT '/app/';

UPDATE`status` SET `db_version` = '1.13.9' WHERE `status`.`id` =1;
