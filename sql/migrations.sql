-- FIXME: truncateだとindexが消えないので冪等性を保つために手動で投入

ALTER TABLE themes ADD INDEX user_id (user_id);

ALTER TABLE livestream_tags ADD INDEX livestream_id (livestream_id);
