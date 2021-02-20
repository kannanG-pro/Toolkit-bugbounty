#! /bin/bash
echo "Hello kannan you'r automating everthing Have good day !"
apt-get install wget -y
wget https://golang.org/dl/go1.16.linux-amd64.tar.gz 
tar -C /usr/local -xzf go1.16.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
echo "export PATH=$PATH:/usr/local/go/bin" > ~/.bashrc

echo "Go installed sucessfully !"

apt-get install -y vim 
apt-get install -y wget 
apt-get install -y curl
apt-get install -y nmap 
apt-get install -y whois 
apt-get install -y python3
apt-get install -y python-pip 
apt-get install -y nano
#subdomain


echo"subdomain tools are installing !"
cd $HOME
mkdir tools
echo -e "${GREEN}[*] Installing amass${NC}"
export GO111MODULE=on
go get -v github.com/OWASP/Amass/v3/...
go get -u -v github.com/tomnomnom/assetfinder
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
cd ~/toolkit 
git clone https://github.com/aboul3la/Sublist3r.git
pip install -r requirements.txt
ln -s ~/tools/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

echo -e "${GREEN}[*] Installing Knockpy${NC}"
apt-get install -y python-dnspython 
cd ~/tools
git clone https://github.com/guelfoweb/knock.git
cd knock
chmod +x setup.py
python setup.py install


echo "${GREEN}[*]  Other tools are downloading !${NC}"
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx
go get -u -v github.com/lc/gau
go get -u -v github.com/lukasikic/subzy
cd $HOME
git clone https://github.com/projectdiscovery/nuclei-templates
GO111MODULE=on go get -v github.com/dwisiswant0/crlfuzz/cmd/crlfuzz
go get -u github.com/tomnomnom/qsreplace
go get -u github.com/ffuf/ffuf

# masscan
echo -e "${GREEN}[*] Installing masscan${NC}"
cd ~/tools
apt-get install -y libpcap-dev
git clone https://github.com/robertdavidgraham/masscan.git
cd masscan
make
ln -sf ~/toolkit/masscan/bin/masscan /usr/local/bin/masscan