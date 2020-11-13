UPDATE wp_options
SET option_value = replace(option_value, 'http://google.com', 'http://google2.com')
WHERE option_name = 'home'
  OR option_name = 'siteurl';
UPDATE wp_posts
SET post_content = replace(post_content, 'http://google.com', 'http://google2.com');
UPDATE wp_postmeta
SET meta_value = replace(meta_value, 'http://google.com', 'http://google2.com');