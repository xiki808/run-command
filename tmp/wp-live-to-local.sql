UPDATE cd_options
SET option_value = replace(option_value, 'http://www.affiliate-theme.loc/', 'http://www.affiliate-theme.loc')
WHERE option_name = 'home'
  OR option_name = 'siteurl';
UPDATE cd_posts
SET post_content = replace(post_content, 'http://www.affiliate-theme.loc/', 'http://www.affiliate-theme.loc');
UPDATE cd_postmeta
SET meta_value = replace(meta_value, 'http://www.affiliate-theme.loc/', 'http://www.affiliate-theme.loc');