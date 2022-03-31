# Spring4Shell PoC Application

![spring4shellapplication](spring4shellapplication.png)


This is a dockerized application that is vulnerable to the Spring4Shell vulnerability (CVE-2022-22965). Full Java source for the war is provided and modifiable, the war will get re-built whenever the docker image is built. The built WAR will then be loaded by Tomcat. There is nothing special about this application, it's a simple hello world that's based off Spring tutorials.


Details: https://www.lunasec.io/docs/blog/spring-rce-vulnerabilities

## Requirements

1. Docker
2. Python3 + requests library

## Instructions

1. Clone the repository
2. Build and run the container: `docker build . -t spring4shell && docker run -p 8080:8080 spring4shell`
3. App should now be available at http://localhost:8080/helloworld/greeting

![WebPage](screenshots/webpage.png?raw=true)

4. Run the exploit.py script:
 `python exploit.py --url "http://localhost:8080/helloworld/greeting"`

![WebPage](screenshots/runexploit_2.png?raw=true)

5. Visit the created webshell! Modify the `cmd` GET parameter for your commands. (`http://localhost:8080/shell.jsp` by default)

![WebPage](screenshots/RCE.png?raw=true)



## Notes

**Fixed!** ~~As of this writing, the container (possibly just Tomcat) must be restarted between exploitations. I'm actively trying to resolve this.~~


Re-running the exploit will create an extra artifact file of {old_filename}_.jsp. 

PRs/DMs [@Rezn0k](https://twitter.com/rezn0k) are welcome for improvements!

## Credits

- [@esheavyind](https://twitter.com/esheavyind) for help on building a PoC. Check out their writeup at: https://gist.github.com/esell/c9731a7e2c5404af7716a6810dc33e1a
- [@LunaSecIO](https://twitter.com/LunaSecIO) for improving the documentation and exploit
- [@rwincey](https://twitter.com/rwincey) for making the exploit replayable without requiring a Tomcat restart
