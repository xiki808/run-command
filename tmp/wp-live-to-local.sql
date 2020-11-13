UPDATE wp_options
SET option_value = replace(option_value, 'https://www.online-slot.co.uk', 'http://www.online-slot.loc')
WHERE option_name = 'home'
  OR option_name = 'siteurl';
UPDATE wp_posts
SET post_content = replace(post_content, 'https://www.online-slot.co.uk', 'http://www.online-slot.loc');
UPDATE wp_postmeta
SET meta_value = replace(meta_value, 'https://www.online-slot.co.uk', 'http://www.online-slot.loc');