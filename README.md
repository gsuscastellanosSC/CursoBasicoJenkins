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
***Class#4***
    ***Manejo Básico de Usuarios***
        Manage Jenkins: Permite acceso a la configuración de los usuarios.
***Class#5***
    ***¿Qué es un Job?***
        Build Executor Status: Permite el acceso para configurar jobs.
***Clase#6***
    ***Configuración de un Job***
        Jenkins > FirstJob > General: 
            [Description]: Descripción del Job.
            [Discard old builds]: Log Rotation.
                [Days to keep builds]: Tiempo para que expiren builds. En días.
                [Max # of builds to keep]: Número maximo de builds.
            [GitHub project]: N/E
            [This build requires lockable resources]: N/E
            [This project is parameterized]: Agregar parametros de entrada al Job.
                [Name]: Nombre del parametro.
                [Default Value]: Valor por defecto.
                [Description]: Descripción del parametro.
                [Trim the string]: N/E
            [Throttle builds]: N/E
            [Disable this project]: En caso de que no queremos que corra el job de forma automatíca en el proyecto, si algo sale mal, marcar esta opción.
            [Execute concurrent builds if necessary]: N/E

            [Source Code Management]:
                [None]: Nada.
                [Git]: Para añadir repos de proyectos.

            [Build Triggers]: Ejecución por medio de varias maneras.
                [Trigger builds remotely (e.g., from scripts)]: Por medio de una API.
                [Build after other projects are built]: Correr otros jobs dependiendo del estado con el que termina cada job.
                    [Trigger only if build is stable]: Job termino ok.
                    [Trigger even if the build is unstable]: Job termino Nok.
                    [Trigger even if the build fails]: Job termino Nok.
                [Build periodically]: Acepta lo mismo que crontab -e.
                [GitHub hook trigger for GITScm polling]: Cuando se hace un push en github se ejecuta el job.
                [Poll SCM]: N/E
            
            [Build Environment]:
                [Delete workspace before build starts]: limpiar el folder del script. **IMPORTANTE**
                [Use secret text(s) or file(s)]: Cosas secretas, variables de entorno o elmentos private.
                [Abort the build if it's stuck]: Controlar que un job falle y no quede en ejecución perpetua.
                [Add timestamps to the Console Output]: Agregar marcas de tiempo a la salida de la consola.
                [Inspect build log for published Gradle build scans]: N/E
                [With Ant]: N/E
            [Build]: Ejecución de shell.
***Clase#7***
    ***¿Cómo Jenkins interactúa con su máquina local?***
        Instalar los programas que vamos a usuar en el jenkins.
            Por ejemplo el binario de nodejs;
                sudo apt install nodejs;
        Nota: No es recomentable ya que se debe tratar de mantener todo portable.
***Clase#8***
    ***Jenkins y su ecosistema de Plugins***
        [Manage Plugins]: Extienden a jenkins y permite mantener portabilidad.
        [Download now and install after restart]: Se recomienda esta opción ya que jenkins termina de ejecutar los jobs pendientes y posteriormente jenkins realiza la instalación.
***Clase#9***
    ***Cadenas de Jobs***


