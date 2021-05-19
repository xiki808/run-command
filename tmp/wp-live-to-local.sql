UPDATE wp_options
SET option_value = replace(option_value, 'https://casinoanbieter.com/', 'http://www.affiliate-theme.loc/')
WHERE option_name = 'home'
  OR option_name = 'siteurl';
UPDATE wp_posts
SET post_content = replace(post_content, 'https://casinoanbieter.com/', 'http://www.affiliate-theme.loc/');
UPDATE wp_postmeta
SET meta_value = replace(meta_value, 'https://casinoanbieter.com/', 'http://www.affiliate-theme.loc/');