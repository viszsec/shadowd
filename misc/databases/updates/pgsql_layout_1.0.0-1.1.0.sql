DELETE FROM tags_filters WHERE filter_id = '74';
DELETE FROM blacklist_filters WHERE id = '74';

UPDATE blacklist_filters SET description = 'Detects possible includes, VBSCript/JScript encoded and packed functions' WHERE id = '14';

INSERT INTO blacklist_filters VALUES (100, '(?:&#?(\w+);)', 3, 'Detects HTML escaped characters');
INSERT INTO blacklist_filters VALUES (101, '(?:[^\w]on(\w+)(\s*)=)', 4, 'Detects possible event handlers');
INSERT INTO blacklist_filters VALUES (102, '(?:\(\)(\s*)\{(.*);(\s*)\}(\s*);)', 6, 'Detects possible Shellshock injection attempts');
INSERT INTO blacklist_filters VALUES (103, '(?:<(?:a|applet|base|body|button|embed|form|frame|frameset|html|iframe|img|input|link|map|meta|object|option|script|select|style|svg|textarea)\W)', 4, 'Detect tags that are the most common direct HTML injection points');
INSERT INTO blacklist_filters VALUES (104, '(?:\|(\s*)$)', 5, 'Detects possible command injection in Perl');
INSERT INTO blacklist_filters VALUES (105, '(?:(?<![\w.-])(?:bash|cc|cmd|curl|ftp|g\+\+|gcc|nasm|nc|netcat|perl|php|ping|python|ruby|sh|telnet|wget)(?![a-z]))', 4, 'Detects possible system commands');
INSERT INTO blacklist_filters VALUES (106, '(?:<\?(?!xml\s))', 4, 'Detects possible PHP open tag');
INSERT INTO blacklist_filters VALUES (107, '(?:\b(?:call_user_func|create_function|eval|exec|f(?:get|open|read|write)|file_(?:get|put)_contents|move_uploaded_file|passthru|popen|proc_open|readfile|shell_exec|system)\b)', 5, 'Detects possible PHP code');
INSERT INTO blacklist_filters VALUES (108, '(?:[\n\r]\s*\b(?:to|b?cc)\b\s*:.*?\@)', 5, 'Detects email injections');
INSERT INTO blacklist_filters VALUES (109, '(?:(?<!\w)(?:\.(?:ht(?:access|passwd|group)|www_?acl)|(?:/etc/(?:passwd|shadow))|boot\.ini|global\.asa|(?:apache|httpd|lighttpd)\.conf)\b)', 4, 'Finds sensible file names');
INSERT INTO blacklist_filters VALUES (110, '(?:<!--\W*?#\W*?(cmd|echo|exec|include|printenv)\b)', 6, 'Detects Server-Site Include injections');

INSERT INTO tags_filters VALUES (1, 100);
INSERT INTO tags_filters VALUES (1, 101);
INSERT INTO tags_filters VALUES (11, 102);
INSERT INTO tags_filters VALUES (1, 103);
INSERT INTO tags_filters VALUES (11, 104);
INSERT INTO tags_filters VALUES (11, 105);
INSERT INTO tags_filters VALUES (11, 106);
INSERT INTO tags_filters VALUES (11, 107);
INSERT INTO tags_filters VALUES (8, 108);
INSERT INTO tags_filters VALUES (10, 109);
INSERT INTO tags_filters VALUES (11, 110);

DROP INDEX IF EXISTS requests_profile_id_idx;
DROP INDEX IF EXISTS requests_caller_idx;
DROP INDEX IF EXISTS requests_learning_idx;
DROP INDEX IF EXISTS requests_client_ip_idx;
DROP INDEX IF EXISTS requests_date_idx;

DROP INDEX IF EXISTS parameters_request_id_idx;
DROP INDEX IF EXISTS parameters_total_rules_idx;
DROP INDEX IF EXISTS parameters_critical_impact_idx;
DROP INDEX IF EXISTS parameters_threat_idx;

DROP INDEX IF EXISTS blacklist_parameters_filter_id_idx;
DROP INDEX IF EXISTS blacklist_parameters_parameter_id_idx;

DROP INDEX IF EXISTS whitelist_parameters_rule_id_idx;
DROP INDEX IF EXISTS whitelist_parameters_parameter_id_idx;

ALTER TABLE profiles ADD COLUMN flooding_time int NOT NULL DEFAULT '0';
ALTER TABLE profiles ADD COLUMN flooding_threshold int NOT NULL DEFAULT '5';
