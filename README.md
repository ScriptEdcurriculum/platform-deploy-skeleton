This is the structure for a particular deployment of the scripted web platform
The following environment variables are used in each environment

MONITOR_PORT - Port which environment monitoring service application runs on
JSBIN_PORT - Port on which JSBin should run
CLOUD9_PORT - Port on which Cloud9 should run
PLATFORM_PORT - Port on which Platform application should run
EXPORT_DIR - Temp directory to use when exporting to github
MYSQL_DB_NAME - Mysql database name
MYSQL_USER - Mysql user for config json
MYSQL_PASSWORD - Mysql user password for config json
JSBIN_GIT_URL - Git clone url for JSBin code deploy
CLOUD9_GIT_URL - Git clone url for Cloud9 code deploy
PLATFORM_GIT_URL - Git clone url for Platform code deploy



#TODO: 

* Commit provision and provision-env-skeleton to github

* Move placeholder start scripts for cloud9/jsbin/platform into repo locations
* Update init environment script to symlink startup script to /etc/init.d and add it to startup
* configure nginx
	* http://blog.argteam.com/coding/hardening-node-js-for-production-part-2-using-nginx-to-avoid-node-js-load/
	* NGinx configurations from jsbin
	* enable ip hash sticky routing for websockets
	* separate config file for each env, include all env config files in main config
	* configure nginx to forward to dev/test/prod
	* generate and configure ssl cert
* store and check out jsbin configuration files for each environment in a private repo
	* necessary?  storing passwords is the issue
* Use a process supervisor in prod- forever
	* Add logging for failure
* create ubuntu vm for cloning
	* also create docker image?

* how to handle zero-downtime deploys
	* investigate use of linode load balancers

* create developer startup script using simple subdomain router

* how to handle generating urls (e.g. platform.scripted.org/jsbin)
	* application needs to not root when generating urls
	* http proxy pass root path to application server as header?


* Update jsbin development howto