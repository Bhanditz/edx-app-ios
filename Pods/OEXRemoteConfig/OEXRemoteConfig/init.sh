#!bin/bash/

###
# Initialize paths
##

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Navigating to directory ${DIR}"
cd $DIR > /dev/null
project_dir="../../.."
path_to_source="${project_dir}/Source"

###
# Update edx.properties
###

echo "Copying the path to OEXRemoteConfig (${project_dir}/edx.properties) into edx.properties"
echo "edx.dir = '${DIR}/config/'" > "${project_dir}/edx.properties"

###
# Revert paths
##

cd - > /dev/null
