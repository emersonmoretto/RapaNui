Welcome to RapaNui
=============

RapaNui is a simple hosts/services monitoring application in Rails 3.0.9. 

It's a kindle of Nagios, but more simple. Don't requires install a client on yours servers machines. 

It can be used as Inventory Manager (for yours servers/computers).

See the screen shots:

https://github.com/emersonmoretto/RapaNui/blob/master/public/images/Screen%20shot%202011-08-08%20at%2015.38.24.png
https://github.com/emersonmoretto/RapaNui/blob/master/public/images/Screen%20shot%202011-08-08%20at%2015.39.47.png
https://github.com/emersonmoretto/RapaNui/blob/master/public/images/Screen%20shot%202011-08-08%20at%2015.40.06.png
https://github.com/emersonmoretto/RapaNui/blob/master/public/images/Screen%20shot%202011-08-08%20at%2015.40.20.png

Features
-------

* Monitoring ping, disks and telnet ports and send e-mail
* 1-Click features (for linux servers): 
* cpuinfo
*  Disk usage (w/ pie chart)
*  top
*  Memory
*  who
*  ifconfig
*  du
*  uptime


Getting Started
-------

After checkout just type

	bundle install
	rake db:migrate
	rails s

* Ruby 1.9.2 is required.

* ImageMagick is required.

for Mac OSX:
	sudo port install ImageMagick

for Ubuntu: 
	sudo apt-get install imagemagick
