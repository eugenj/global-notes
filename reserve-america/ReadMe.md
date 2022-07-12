sudo systemctl enable cron
crontab -e

*/3 * * * * /home/evgeny_zhuravlev/reserve_america/reserve_america.sh >> /home/evgeny_zhuravlev/reserve_america/run.log
