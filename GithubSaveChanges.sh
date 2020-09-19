messageCommit=${1};
origin=${2};
echo "${messageCommit}" "${origin}";
git add .
git commit -asm messageCommit;