

Steps for usage:
docker and docker-compose is required, use docker desktop if possible since it'll install both

requires jdk 23 from https://www.oracle.com/java/technologies/downloads/#jdk23-windows 

Set the JAVA_HOME environment variable to point to your JDK installation directory.

Try below line

./mnvw spring-boot:run

if running into issues with running above line then install maven from https://maven.apache.org/download.cgi, get the binary

Extract the downloaded archive to a directory on your machine.

Set the MAVEN_HOME environment variable to point to your Maven installation directory.

Add %MAVEN_HOME%\bin to your system's PATH environment variable.

Press Win + R, type cmd, and hit Enter to open the Command Prompt.

cd C:\path\to\your\project

mvn spring-boot:run

Site should be accessible at http://localhost:8080

db should be preloaded already,

if you add things to the db and you want it to stay in the github,

run the ./backup.sh script

run the backup.bat if using windows
