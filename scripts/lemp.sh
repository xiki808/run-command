case $2 in

restart)
sudo service nginx restart
sudo service php7.4-fpm restart
sudo service mysql restart
;;
stop)
sudo service nginx stop
sudo service php7.4-fpm stop
sudo service mysql stop
;;
*)
sudo service nginx start
sudo service php7.4-fpm start
sudo service mysql start
