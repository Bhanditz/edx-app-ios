#!bin/bash/

###
# Initialize paths
##

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Navigating to directory ${DIR}"
cd $DIR > /dev/null
project_dir="../../.."
path_to_source="${project_dir}/Source"
path_to_resources="${path_to_source}/Resources"

###
# Delete existing assets
###

echo "Removing assets at ${path_to_resources}"
rm -rf "${path_to_resources}/Colors"
rm -rf "${path_to_resources}/Images"
rm -rf "${path_to_resources}/Fonts"
rm -rf "${path_to_resources}/Stylesheets"
rm -rf "${path_to_resources}/Splash"

echo "Removing assets at ${path_to_source}"
rm -rf "${path_to_source}/en.lproj"
rm -rf "${path_to_source}/COURSE_NOT_LISTED.htm"
rm -rf "${path_to_source}/EULA.htm"
rm -rf "${path_to_source}/NEW_USER.htm"
rm -rf "${path_to_source}/Terms-and-Services.htm"

###
# Copy custom assets
###

echo "Copying assets to ${path_to_resources}"
cp -R Colors "${path_to_resources}/Colors"
cp -R Images "${path_to_resources}/Images"
cp -R Fonts "${path_to_resources}/Fonts"
cp -R Stylesheets "${path_to_resources}/Stylesheets"

echo "Copying assets to ${path_to_source}"
cp -R Strings/en.lproj "${path_to_source}/en.lproj"
cp -R Strings/COURSE_NOT_LISTED.htm "${path_to_source}/COURSE_NOT_LISTED.htm"
cp -R Strings/EULA.htm "${path_to_source}/EULA.htm"
cp -R Strings/NEW_USER.htm "${path_to_source}/NEW_USER.htm"
cp -R Strings/Terms-and-Services.htm "${path_to_source}/Terms-and-Services.htm"

###
# Update plist
###

echo "Updating plist at ${path_to_source}/edX-Info.plist"
/usr/libexec/PlistBuddy -c "Delete :UIAppFonts" "${path_to_source}/edX-Info.plist"
/usr/libexec/PlistBuddy -c "Delete :CFBundleDisplayName" "${path_to_source}/edX-Info.plist"
/usr/libexec/PlistBuddy -c "Delete :CFBundleName" "${path_to_source}/edX-Info.plist"
/usr/libexec/PlistBuddy -c "Delete :CFBundleSpokenName" "${path_to_source}/edX-Info.plist"
/usr/libexec/PlistBuddy -c "Delete :FacebookDisplayName" "${path_to_source}/edX-Info.plist"
/usr/libexec/PlistBuddy -c "Merge ${DIR}/Config/.env.default.plist" "${path_to_source}/edX-Info.plist"

###
# Revert paths
##

cd - > /dev/null
