# Copy static site
CWD=`pwd`

# Clone Pages repository
cd /tmp
git clone git@github.com:jwrubel/ga-contentful.git build
# cd build && git checkout -b YOUR_BRANCH origin/YOUR_BRANCH # If not using master

# Trigger Jekyll rebuild
cd $CWD
bundle exec CONTENTFUL_ACCESS_TOKEN=${ENV_CONTENTFUL_ACCESS_TOKEN} CONTENTFUL_SPACE_ID=${ENV_CONTENTFUL_SPACE_ID} jekyll contentful
bundle exec jekyll build

# Push newly built repository
cp -r $CWD/_build/* /tmp/build # or $CWD/_site

cd /tmp/build

git config --global user.email "jwrubel@gmail.com"
git config --global user.name "James Wrubel"

git add .
git commit -m "Automated Rebuild"
git push -f origin master
