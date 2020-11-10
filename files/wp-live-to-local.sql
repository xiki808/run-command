UPDATE <prefix>_options
SET option_value = replace(option_value, '<old>', '<new>')
WHERE option_name = 'home'
  OR option_name = 'siteurl';
UPDATE <prefix>_posts
SET post_content = replace(post_content, '<old>', '<new>');
UPDATE <prefix>_postmeta
SET meta_value = replace(meta_value, '<old>', '<new>');