
ALTER TABLE APPLICATION_SHORTCUTS ALTER COLUMN NAME RENAME TO NAME_OLD;
ALTER TABLE APPLICATION_SHORTCUTS ADD COLUMN NAME VARCHAR(255) DEFAULT '' NOT NULL;
UPDATE APPLICATION_SHORTCUTS SET NAME = NAME_OLD;
ALTER TABLE APPLICATION_SHORTCUTS DROP COLUMN NAME_OLD;

ALTER TABLE APPLICATION_SHORTCUTS ALTER COLUMN DESCRIPTION RENAME TO DESCRIPTION_OLD;
ALTER TABLE APPLICATION_SHORTCUTS ADD COLUMN DESCRIPTION VARCHAR(1024) DEFAULT '' NOT NULL;
UPDATE APPLICATION_SHORTCUTS SET DESCRIPTION = DESCRIPTION_OLD;
ALTER TABLE APPLICATION_SHORTCUTS DROP COLUMN DESCRIPTION_OLD;

ALTER TABLE APPLICATION_SHORTCUTS ADD COLUMN AUTO_START BOOLEAN DEFAULT false not null;