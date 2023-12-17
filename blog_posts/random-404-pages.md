One of the artists I listen to, [Emma Essex](https://halleylabs.com), has this cool thing on [their website](https://heckscaper.com) where the 404 page is a different one every time. I thought to myself that this can be done simply and it surprisingly can be done pretty easily.

All it requires is a cgi-bin script, a folder full of HTML files, and some extra stuff in nginx.

## Initializing

I'll be using `/var/www/html` as the root folder for all my stuff, and I'll be using nginx on Rocky Linux 9.x.

First off, create 2 directories in your `/var/www/html` folder;
- `cgi-bin`
  - Folder where our script will go
- `404_pages`
  - Directory where pages will be randomly selected.

I've made 2 files in the `404_pages` directory.

`simple.html`
```html
<h1>404, page not found.</h1>
<p>The page that you're looking for doesn't exist.</p>
```

and `simple_alt.html`
```html
<h1>404, page not found</h1>
<p>w-wha! the page that you're looking for doesn't exist ;w;</p>
```

I've also made a script in the `cgi-bin` directory with the name of `rand.sh`.
```bash
#!/bin/bash
item=$(find /var/www/html/404_pages -type f | shuf -n 1)
echo "Content-Type: text/html"
echo ""
cat $item
```

Make sure that the `rand.sh` file has the correct permissions
```bash
sudo chown nginx:nginx /var/www/html/cgi-bin/rand.sh
sudo chmod 777 /var/www/html/cgi-bin/rand.sh
```

You also need to install the `fcgiwrap` package.
```bash
# debian-based
sudo apt install fcgiwrap
# rhel-based
sudo dnf install fcgiwrap
```

## Adding stuff in the nginx config
For the fcgi stuff to work, you need to add a couple of things to your nginx config.

Here's a basic config that creates a new route at `/404` which then runs the fgci script result, and it will replace the 404 route with the output contents of the fcgi script.
```nginx
server {
        listen 80;
        server_name _;
        root /var/www/html/;
        index index.html;

        error_page 404 /404;

        location = /404 {
                gzip off;
                include fastcgi_params;
                fastcgi_pass unix:/var/run/fcgiwrap.sock;
                fastcgi_param SCRIPT_FILENAME /var/www/html/cgi-bin/rand.sh;
        }
}
```

## Extra scripts to make things work properly
With the way that fcgiwrap is configured, there are a couple of things you need to do in order to get it working.

Create the file `/etc/systemd/system/fcgiwrap.service` with the following content
```ini
[Unit]
Description=FastCGIWrap Service
After=network-online.target

[Service]
Type=exec
ExecStart=/usr/sbin/fcgiwrap
User=nginx
Group=nginx

[Install]
WantedBy=multi-user.target
```

Also create the file `/etc/systemd/system/fcgiwrap.socket` with the following content
```ini
[Unit]
Description=FastCGIWrap Socket

[Socket]
ListenStream=/run/fcgiwrap.sock
User=nginx
Group=nginx

[Install]
WantedBy=sockets.target
```

You also need to create a service which sets the correct permissions for the `/run/fcgiwrap.sock` file

Create the script at `/root/fcgi-init.sh` and make sure it's chmod is `777`
```bash
#!/bin/bash
chown nginx:nginx -R /var/run/fcgiwrap.sock
chmod 777 /var/run/fcgiwrap.sock
```

And create the service at the location `/etc/systemd/system/fcgi-init.service`
```ini
[Unit]
Description=Initialize FCGIWrap Service
After=network-online.target

[Service]
Type=exec
ExecStart=/root/fcgi-init.sh
User=root
Group=root

[Install]
WantedBy=multi-user.target
```

## Finalizing
Make sure that all the services are running and enabled
```bash
systemctl enable --now fcgiwrap.socket
systemctl enable --now fcgiwrap.service
systemctl enable --now fcgi-init.service
```

Now when you try and load a page that doesn't exist, it should use one of the files in `/var/www/html/404_pages`.

![screen recoding demoing the random 404 pages](https://res.kate.pet/upload/6f589ebeacbf/firefox_L2jr3k5cUu.gif)