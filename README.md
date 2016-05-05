JBoss BRMS Suite Cool Store Demo with AngularJS & Patternfly
================================
This is a retail web store demo where you will find rules, decision tables, events, and a ruleflow 
that is accessed by a single page [Angular JS](https://angularjs.org)-based application, protected by [KeyCloak](http://keycloak.jboss.org), whose UX is driven primarily by the patterns and best practices from [PatternFly](https://patternfly.org). The demo is a remake of the [JBoss Developer Cool Store Vaadin-based Demo](https://github.com/jbossdemocentral/brms-coolstore-demo).

The web application is a WAR built using the JBoss BRMS
generated project as a dependency, providing an example project showing how developers can focus on the 
application code while the business analysts can focus on rules, events, and ruleflows in the 
JBoss BRMS product web based dashboard.

This demo is built with, contained by and executed using [Docker](https://docker.com).


Building the Demo with Docker
-----------------------------------------
The following steps can be used to configure and run the demo in a container

1. [Download and unzip.](https://github.com/jbossdemocentral/brms-coolstore-demo-angular-patternfly/archive/master.zip)

2. Add products [installs directory](installs/).

3. Copy contents of [support/docker](support/docker) directory to the project root.

4. Build demo image

	```
	$ docker-compose build
	```
5. Start demo containers

	```
	$ docker-compose up
	```
		
6. Login to JBoss Business Central at `http://<DOCKER_HOST>:8080/business-central`

    - login for admin and analyst roles (u:`erics` / p:`jbossbrms1!`)
    - Navigate to `Authoring -> Project Authoring -> Open Project Editor -> Build -> Build & Deploy` to deploy the project in BRMS.

7. Login to Keycloak admin console at `http://<DOCKER_HOST>:8181/auth`

   - login for keycloak admin (u:jfalkner / p:keycloak1!)
	- Observe keycloak config (but don't change anything)

8. Open shopping cart and demo away (`http://<DOCKER_HOST>:8080/brms-coolstore-demo`)

	- login for the cool store is (u:`jfalkner` / p:`keycloak1!`)
	
Note that if you are using Docker through a VM (e.g. when using Docker on Mac OS X), you will need [forward your localhost ports to the Docker VM](https://github.com/boot2docker/boot2docker/blob/master/doc/WORKAROUNDS.md#port-forwarding) or change `localhost` to your Docker VM's IP address in [keycloak.json](src/main/webapp/keycloak.json).
  
Additional information can be found in the jbossdemocentral container [developer repository](https://github.com/jbossdemocentral/docker-developer)


Notes
-----
The server application (shopping cart) is built during demo installation with a provided coolstore project jar version 2.0.0. When you 
open the project you will find the version is also set to 2.0.0. You can run the web application as is, but if you build and deploy
a new version of 2.0.0 to your maven repository it will find duplicate rules. To demo you deploy a new version of the coolstore
project by bumping the version number on each build and deploy, noting the KieScanner picking up the new version within 10 seconds 
of a new deployment. For example, initially start project, bump the version to 3.0.0, build and deploy, open web application and
watch KieScanner in server logs pick up the 3.0.0 version. Now change a shipping rule value in decision table, save, bump project
version to 4.0.0, build and deploy, watch for KieScanner picking up new 4.0.0 version, now web application on next run will use new
shipping values.


References
----------
- [JBoss Developer Cool Store Vaadin-based Demo](https://github.com/jbossdemocentral/brms-coolstore-demo)

- [JBoss Developer Cool Store Vaadin-based Demo](https://github.com/jbossdemocentral/brms-coolstore-demo)

- [Demo Overview and Docs] (https://github.com/jbossdemocentral/brms-coolstore-demo/docs)


Released versions
-----------------
See the tagged releases for the following versions of the product:

- v1.0 Initial version based on the awesome [JBoss Developer Cool Store Vaadin Demo](https://github.com/jbossdemocentral/brms-coolstore-demo)

