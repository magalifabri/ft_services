nginx install on Alpine container

/etc/nginx/**nginx.conf**;

```conf
events {
        # The maximum number of simultaneous connections that can be opened by
        # a worker process.
        worker_connections 1024;
}

http {
        # Includes mapping of file name extensions to MIME types of responses
        # and defines the default type.
        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        # Name servers used to resolve names of upstream servers into addresses.
        # It's also needed when using tcpsocket and udpsocket in Lua modules.
        #resolver 208.67.222.222 208.67.220.220;

        # Don't tell nginx version to clients.
        server_tokens off;

        # Specifies the maximum accepted body size of a client request, as
        # indicated by the request header Content-Length. If the stated content
        # length is greater than this size, then the client receives the HTTP
        # error code 413. Set to 0 to disable.
        client_max_body_size 1m;

        # Timeout for keep-alive connections. Server will close connections after
        # this time.
        keepalive_timeout 65;

        # Sendfile copies data between one FD and other from within the kernel,
        # which is more efficient than read() + write().
        sendfile on;

        # Don't buffer data-sends (disable Nagle algorithm).
        # Good for sending frequent small bursts of data in real time.
        tcp_nodelay on;

        # Causes nginx to attempt to send its HTTP response head in one packet,
        # instead of using partial frames.
        #tcp_nopush on;


        # Path of the file with Diffie-Hellman parameters for EDH ciphers.
        #ssl_dhparam /etc/ssl/nginx/dh2048.pem;

        # Specifies that our cipher suits should be preferred over client ciphers.
        ssl_prefer_server_ciphers on;

        # Enables a shared SSL cache with size that can hold around 8000 sessions.
        ssl_session_cache shared:SSL:2m;


        # Enable gzipping of responses.
        #gzip on;

        # Set the Vary HTTP header as defined in the RFC 2616.
        gzip_vary on;

        # Enable checking the existence of precompressed files.
        #gzip_static on;


        # Specifies the main log format.
        log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                        '$status $body_bytes_sent "$http_referer" '
                        '"$http_user_agent" "$http_x_forwarded_for"';

        # Sets the path, format, and configuration for a buffered log write.
        access_log /var/log/nginx/access.log main;


        # Includes virtual hosts configs.
        include /etc/nginx/conf.d/*.conf;
}
```

/etc/nginx/conf.d/**default.conf**
```conf
# This is a default site configuration which will simply return 404, preventing
# chance access to any other virtualhost.

server {
        listen 80 default_server;
        listen [::]:80 default_server;

        # Everything is a 404
        location / {
                return 404;
        }

        # You may need this to prevent return 404 recursion.
        location = /404.html {
                internal;
        }
}
```
