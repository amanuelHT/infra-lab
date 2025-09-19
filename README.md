# infra-lab (linux drift prosjekt)

- **Linux serverdrift**
- **Apache + PHP** som portal-front
- **PostgreSQL** database (Oracle-lignende øving)
- **Tomcat** (Java-applikasjonsdrift)
- **Bash-skript** for start/stop/status

## Hvordan kjøre (kort)
1. Start tjenester: `sudo service apache2 start && sudo service postgresql start && sudo service tomcat9 start`
2. Portal (PHP): `http://localhost`
3. Java-app via Apache proxy: `http://localhost/app`  (ruter til Tomcat /hello/)
4. DB-test (PHP → PostgreSQL): `http://localhost/dbtest.php`
5. Driftsskript: `./scripts/manage_services.sh status`
