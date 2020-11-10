UPDATE wp_options
SET option_value = replace(option_value, 'http://www.bonus-codes.local', 'http://www.bonus-codes.loc')
WHERE option_name = 'home'
  OR option_name = 'siteurl';
UPDATE wp_posts
SET post_content = replace(post_content, 'http://www.bonus-codes.local', 'http://www.bonus-codes.loc');
UPDATE wp_postmeta
SET meta_value = replace(meta_value, 'http://www.bonus-codes.local', 'http://www.bonus-codes.loc');