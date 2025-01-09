ALREADY_EXISTS='false'

if [ -f "/etc/nginx/key/jogomes-.crt" ] && [ -f "/etc/nginx/key/jogomes-.key" ]; then
	ALREADY_EXISTS='true'
fi

if [ "$ALREADY_EXISTS" = 'false' ]; then
	mkdir /etc/nginx/key
	openssl genrsa -out /etc/nginx/key/jogomes-.key 2048
	openssl req -new -x509 -key /etc/nginx/key/jogomes-.key -out /etc/nginx/key/jogomes-.crt -days 365 -subj "/CN=jogomes-.42.fr"
else
	echo "certificate already exists"
fi
