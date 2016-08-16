echo "Intalling Node.js from separate script"
nodeJsUrl=https://nodejs.org/dist/v4.5.0/node-v4.5.0-linux-x86.tar.xz
appDir=$1
cacheDir=$2
##############################################################################################
# Node.js setup
##############################################################################################
echo ===== setting up Node.js =====
cd $cacheDir
if [ -f node-v4.5.0-linux-x86.tar.xz]; then
    echo "Found node.js install in cache"
else
    wget $jdkUrl -O node-v4.5.0-linux-x86.tar.xz # would be nice to use -N but it doesn't work for this url.
fi

cd ${appDir}
mkdir nodejs
cd nodejs
echo "Unzipping to " `pwd`
tar xzf ${cacheDir}/node-v4.5.0-linux-x86.tar.xz

nodeJsDirName=`ls` # there should be just one sub dir here so this shoud work to find its name.
echo "nodeJsDirName = " $nodeJsDirName
#export JAVA_HOME=$appDir/jdk/$javaDirName