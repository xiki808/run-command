INSERT INTO <prefix>_users (
    `ID`,
    `user_login`,
    `user_pass`,
    `user_nicename`,
    `user_email`,
    `user_url`,
    `user_registered`,
    `user_activation_key`,
    `user_status`,
    `display_name`
  )
VALUES (
    '<id>',
    'admin',
    MD5('asdf'),
    'admin',
    'daniel.scicluna@kafe.rocks',
    'http://www.google.com/',
    '2011-06-07 00:00:00',
    '',
    '0',
    'Admin'
  );
INSERT INTO <prefix>_usermeta (`umeta_id`, `user_id`, `meta_key`, `meta_value`)
VALUES (
    NULL,
    '<id>',
    'wp_capabilities',
    'a:1:{s:13:"administrator";s:1:"1";}'
  );
INSERT INTO <prefix>_usermeta (`umeta_id`, `user_id`, `meta_key`, `meta_value`)
VALUES (NULL, '<id>', 'wp_user_level', '10');