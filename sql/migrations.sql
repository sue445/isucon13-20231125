-- FIXME: truncateだとindexが消えずに冪等性がないのでここで手動で追加

ALTER TABLE themes ADD INDEX user_id (user_id);

ALTER TABLE livestream_tags ADD INDEX livestream_id (livestream_id);
