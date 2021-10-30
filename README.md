# pruebas jenkins local backend

password para registro jenkins: 5ab6ad858fc549808be280eeeb74610d


Estos archivos están sacados del repo prueba jenkins frontend local





## Configurar

docker-compose up o docker-compose up -d (segundo plano)

 Una vez se haga en docker-compose configurar jenkins y nexus para que al realizar el build en pipeline funcione todo.

## nexus

 - Empezando por nexus docker exec prueba-jenkins-backend-local_nexus_1 cat /nexus-data/admin.password para saber la password y poder entrar al nexus

 - Cambiar la pass por admin, poner Enable anonymous access

 - En configuración ir a repositorios y crear un docker (hosted) con un puerto http 8082, marcar enable docker V1 API, deployment policy en disable redeploy y marcar allow redeploy only 'latest' tag y crear.

## jenkins

 Para saber la pass inicial de jenkins docker exec -u root prueba-jenkins-backend-local_jenkins_1 cat /var/jenkins_home/secrets/initialAdminPassword

 - Plugin hay que añadir el de gitlab y blue ocean para ver mejor los stages.

 - Al poner la password nos deja configurar nuevo usuario password y tal, poner todo admin

 - en new item crear un multibranch pipeline y añadir repo prueba jenkins backend local, branch sources añadimos un git, ponemos el link del repo, nuestras credenciales de gitlab el tipo tiene que ser en username y password creamos, y automaticamente te ejecuta el jenkinsfile que hay.
