
# Blog-API
REST API of  a triangle checker and a BLOG in Ruby on Rails

This README would guide you to run this application on Ubuntu 18.04. If you are using Windows(64 bit), follow the steps given below:

## Running on Windows:
Open Powershell as Administrator and run:
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
Next install Ubuntu from the Microsoft Store and open Ubuntu in the Start menu. You'll be asked to setup a new user for Ubuntu. Remember this password as it will be required when installing packages with sudo. Now follow the steps for running on Ubuntu.
## Running on Ubuntu:
#### Installing Ruby
The version of Ruby you need to install is 2.7.1. We will install the same using rvm:
```
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
rvm install 2.7.1
source ~/.rvm/scripts/rvm
rvm use 2.7.1 --default
ruby -v
```
The output of the last command should be something like this:
> ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
The last step is to install Bundler
```
gem install bundler
```
#### Installing Rails
The version of Rails required for running this application smoothly is 6.0.2.2. Before installing rails, we need to install nodejs and yarn
```
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt-get install -y nodejs yarn
```
And now, without further delay:
```
gem install rails -v 6.0.2.2
rails -v
```
The output of the last command should be something like this:
> Rails 6.0.2.2
#### Setting Up MySQL
```
sudo apt-get install mysql-server mysql-client libmysqlclient-dev
mysql_secure_installation

```
Installing the libmysqlclient-dev gives you the necessary files to compile the mysql2 gem which is what Rails will use to connect to MySQL when you setup your Rails app.

#### Final Steps
Now, Clone or Download ZIP file of this repository and navigate to the place where you extract this in the terminal.
If you are using Linux Subsystem on Windows, suppose you extracted the repo zip in G:// drive. Navigate to it by running:
```
cd /mnt/g/Blog-API-master/
bundle install
```
The installation will take some time. After the installation is complete, run the mysql service using the following command:
```
sudo -i
```
Enter the password.
```
/etc/init.d/mysql start
```
Set the database username and password for MySQL settings in config/database.yml in any text editor. You can specify different database names for different environments.Now, you need to setup the database for the application.
```
rake db:create
rails db:migrate  
```
Run the server on the [localhost](http://127.0.0.1:3000/).

#### To run all the tests simulataneously, run:
```
rake
```

#### To run the tests on models/containers, run:
```
rails test test/models/[comment_test.rb|post_test.rb|triangle_test.rb]
rails test test/controllers/[comments_controller_test.rb|posts_controller_test.rb|triangle_controller_test.rb]
```

