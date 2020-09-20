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
        Install Plugin Parameterized Trigger plugin.

        Primero instalamos el plugin Parameterized Trigger, igual cómo instalamos anteriormente y reiniciamos.

        Luego vamos a crear 2 jobs nuevos:
            watchers: En este job, vamos a configure y vamos a “Build after other projects are built” y escribimos y escribimos hello-platzi, sí hello-platzi es successful, quiero que se ejecute watchers.
            Y en la parte de executed shell, escribimos : echo “Running after hello-platzi success” y guardamos.
            parameterized: 
                Acepta parámetros cuando lo llamo. Marcamos la opción “ This project is parameterized” y en el name escribimos ROOT_ID.
                    Y en el execute shell: 
                echo “calle with $ROOT_ID” y guardamos.

            Y en hello-platzi, en Downstream project, y estos se añaden cuando jenkins se da cuenta que su job tiene una dependencia con otro.
            Vamos al configure de hello-platzi y en el execute shell escribimos:
                echo “Hello Platzi from $NAME”
            Y añadir un build step que se llama : 
                “Trigger/call build on other projects”, y en projects to build escribimos parameterized y le damos en añadir parámetros, luego parámetros predefinidos y escribimos:
                ROOT_ID=$BUILD_NUMBER
                BUILD_NUMBER es una variable de entorno, que es el valor de esta ejecución y guardamos.

            Le damos en “build with parameters” y entramos al console output de parameterized y vemos que la ejecución número tal, fue la que ejecutó a parameterized.
            Corre hello-platzi, él llama declarativamente a parameterized e indirectamente a watchers.

            Corre los test para esta versión, cuando acabes, mandame esta versión a producción le pasó el id del commit, y se lo pasó a mí job que hace deployment y cuando lo resuelvas me lo despliegas.
            El sabe la cadena de ejecuciones que tuvo, y cuál fue el que inició este proceso.
            El profe recomienda usar parameterized jobs en vez de watchers, porque cuando uso watchers solo tengo tres opciones mientras que con parameterized jobs tengo más opciones.
***Clase#10**
    ***Connectándonos a GitHub***
        Es posible conectar un repositorio de GitHub a Jenkins para que cada vez que exista un push se haga un build del source code. Para que esto sea posible debemos realizar cambios tanto en Jenkins como en GitHub.
        ***En Jenkins:***
            1- Debemos tener el GitHub plugin instalado
            2- Al crear el Job, debemos marcar el SCM la opción de Git, y pegar la URL del repo. (Para esta acción el host de Jenkins debe tener instalado Git)
            3- En el apartado "branches to build" si dejamos en blanco tomara en cuenta cualquier branch. 
            4- En "Build Triggers" debemos marcar la opción "GitHub hook trigger for GITScm polling"
        ***En GitHub:***
            1- Vamos al repo de GitHub.
            2- Entramos en Settings -> Webhooks.
            3- Añadimos un nuevo Webhook.
            4- Añadimos la Payload URL. (Si la URL no acaba en /github-webhook/ GItHub lanzara un error.)
            5- Marcar "Just the push event"
    ***Fuenetes:**
***Clase#11**
    ***¿Qué es un \'Pipeline\'?***
        Pipelines nos permiten configurar nuestros Jobs con código en lugar de hacerlo en la interfaz visual. En Jenkins los hay de dos maneras: Scripting y Declarative.
