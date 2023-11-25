-- FIXME: truncateだとindexが消えないので冪等性を保つために手動で投入

ALTER TABLE livecomments ADD INDEX livestream_id (livestream_id);

ALTER TABLE livestream_tags ADD INDEX livestream_id (livestream_id);

ALTER TABLE reactions ADD INDEX livestream_id_and_created_at (livestream_id, created_at);

ALTER TABLE themes ADD INDEX user_id (user_id);
