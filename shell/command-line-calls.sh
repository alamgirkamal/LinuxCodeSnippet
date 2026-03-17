# Delete user
sudo userdel <user-name>

# Delete user including home folder and mail spool
sudo userdel -r <user-name>

# Kill all processes running by user
sudo killall -u <user-name>
sudo pkill -KILL -u <user-name>

# Kill all scheduled crontab jobs by a user
sudo crontab -r -u <user-name>
