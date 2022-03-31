# Spring4Shell PoC Application

This is a dockerized application that is vulnerable to the Spring4Shell vulnerability. Full Java source for the war is provided and modifiable, the war will get re-built whenever the docker image is built. There is nothing special about this application, it's a simple hello world that's based off Spring tutorials.

Details: https://www.lunasec.io/docs/blog/spring-rce-vulnerabilities

## Requirements

1. Docker + Docker-Compose
2. Python3 + requests library

## Instructions

1. Clone the repository
2. Run the container: `docker-compose up --build`
3. App should now be available at http://localhost:8080/helloworld/greeting

![WebPage](screenshots/webpage.png?raw=true)

4. Run the exploit.py script: 
 `python3 .\exploit.py -url "http://localhost:8080/helloworld/greeting" -f shell`

![WebPage](screenshots/runexploit_2.png?raw=true)

5. Visit the created webshell! Modify the `cmd` GET parameter for your commands. (`http://localhost:8080/shell.jsp` by default)

![WebPage](screenshots/RCE.png?raw=true)



## Notes

As of this writing, the container (possibly just Tomcat) must be restarted between exploitations. I'm actively trying to resolve this, PRs/DMs [@Rezn0k](https://twitter.com/rezn0k) are welcome!

## Credits

Big shout out to [@esheavyind](https://twitter.com/esheavyind) for help on building a PoC. Check out their writeup at: https://gist.github.com/esell/c9731a7e2c5404af7716a6810dc33e1a
