# CursoBasicoJenkins
    https://platzi.com/clases/jenkins-basico/
***Class#1**
    ***Introducción a Automatización***
***Class#2**
    ***Introducción a Jenkins***
        Jenkins es Open Source
        Jenkinks corre en Java
        Jenkinks se puede hacer escalable verticalmente (Recursos de hardware)
        Jenkinks se puede hacer escalable horizontalmente(Varios Nodos Cluster++)
***Class#3**
    ***Instalación y Configuración Básica de Jenkins***
        Documentación de Jenkins: https://www.jenkins.io/doc/
        ***Instalación***
            <!-- https://pkg.jenkins.io/debian-stable/ -->
            sudo apt update && sudo apt upgrade -y;
            sudo apt-get install openjdk-8-jdk wget gnupg -y;
            wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -;
            sudo nano /etc/apt/sources.list;
                add it line deb https://pkg.jenkins.io/debian-stable binary/;
            sudo apt update && sudo apt upgrade -y;
            sudo apt-get install jenkins -y;
            service jenkins status;
        