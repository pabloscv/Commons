sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
sudo echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo echo 'nano /proc/sys/vm/swappiness - vm.swappiness=10'
sudo echo 'nano /proc/sys/vm/vfs_cache_pressure - vm.vfs_cache_pressure=50'
