# kate.pet
Personal website written in PHP, using Smarty for templates, and a lot of home-made CSS.

## Screenshots
![image](https://res.kate.pet/upload/9a6f27ba76e7/vivaldi_bbuK4U6XZR.png)

![image](https://res.kate.pet/upload/2a058357f5b8/vivaldi_VdgDhqpLmU.png)

![image](https://res.kate.pet/upload/49934074b42d/vivaldi_s3lrCM3xHL.png)

## Setup development environment
For a development environment you must have the following installed;
- nginx
- PHP 8.x
    - php-fpm
    - composer ([see](https://getcomposer.org/download/))

1. copy `.env.example` to `.env` and replace the proper variable with your own (like `WEB_ROOT` with where you cloned this repo.)
2. copy `nginx.conf` to where your nginx configs go (and replace `kate.pet` with whatever domain you wish) and make sure that `fastcgi_pass` is using the correct socket location.
3. make sure you install dependencies with `composer install` (in the `web` folder)

and you should be set :3

## Notes for Kate
- when adding a blog post, make sure that there is a `.md` file with the same name as the `.php` file in [`./web/blog_posts/`](blog_posts/)
    - this is because `retrieveBlogPost($postId)` fetches the content by fetching a file with the same name as the `postId` provided but with the extension of `.md` instead of `.php`
- when fetching stuff from the GET parameters (in `$_REQUEST`), make sure to sanitize with the [`basename`](https://www.php.net/manual/en/function.basename.php) function