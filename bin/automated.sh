echo '******************************************'
echo '**** Updating content from Contentful ****'
echo '******************************************'
CONTENTFUL_ACCESS_TOKEN=${ENV_CONTENTFUL_ACCESS_TOKEN} CONTENTFUL_SPACE_ID=${ENV_CONTENTFUL_SPACE_ID} bundle exec jekyll contentful
echo '******************************************'
echo '****         rebuilding site          ****'
echo '******************************************'
bundle exec jekyll build

echo '******************************************'
echo '****         diffing content          ****'
echo '******************************************'

git --no-pager diff

echo '******************************************'

echo '******************************************'
echo '**** Publish updates to Github Pages  ****'
echo '******************************************'

git config --global user.email "jwrubel@gmail.com"
git config --global user.name "James Wrubel"

echo '**** Committing updated content ****'
git add .
git commit -m "Automated Publish"

echo '**** Pushing updated content to Github ****'
git push -f origin master

echo '*************************************************'
