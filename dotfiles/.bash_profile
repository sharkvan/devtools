#This is for rbenv support
eval "$(rbenv init -)"

export PATH=~/.rbenv/shims:$PATH
export PATH=/opt/packer:$PATH
export PATH=/Users/schruben/Library/Android/sdk:$PATH
export PATH=/Users/schruben/.shell-commands:$PATH

export JAVA_HOME=$(/usr/libexec/java_home)

#alias elm-make='docker run -it --rm -v "$(pwd):/code" -w "/code" -e "HOME=/tmp" -u $UID:$GID -p 8000:8000 codesimple/elm:0.17 make'
#alias elm-package='docker run -it --rm -v "$(pwd):/code" -w "/code" -e "HOME=/tmp" -u $UID:$GID -p 8000:8000 codesimple/elm:0.17 package'
#alias elm-repl='docker run -it --rm -v "$(pwd):/code" -w "/code" -e "HOME=/tmp" -u $UID:$GID -p 8000:8000 codesimple/elm:0.17 repl'
alias nginx='docker run -it --rm -v "$(pwd):/usr/share/nginx/html:ro" -p 8080:80 nginx'





filter_access_log ()
{
    {
        grep -v "/content/scripts/utilities/pubListRebuild" | grep -v "/content/rand/topics" | grep -v "/content/rand/pubs" | grep -v "/content/rand/blog" | grep -v "/content/rand/multimedia" | grep -v "/content/rand/labor" | grep -v "/content/prgs/faculty" | grep -v "Apache Sling Resource Resolver Finalizer Thread" | grep -v "/content/rand/news" | grep -v "/content/prgs/students" | grep -v "/content/rand/congress" | grep -v "/content/rand/profile" | grep -v "/content/prgs/profile"
    }
}
