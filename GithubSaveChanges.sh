repoName=${1};
messageCommit=${2};
tagName=${3};

if [ repoName!="" -a messageCommit!="" -a tagName!="" ]
    then
        ruta='/Documents/github/';
            cd  ~/$ruta/$repoName;
        echo "En la ruta `pwd`";
        git add .
        git commit -asm messageCommit;
        git tag -a ${tagName} -m ${messageCommit};
        git push origin;
        git push --tags;
else
    echo "Ingresar:";
    echo "repoName";
    echo "messageCommit";
    echo "tagName";
fi