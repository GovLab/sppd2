echo '******************************************'
echo '**** Updating content from Contentful ****'
echo '******************************************'
CONTENTFUL_ACCESS_TOKEN=${ENV_CONTENTFUL_ACCESS_TOKEN} CONTENTFUL_SPACE_ID=${ENV_CONTENTFUL_SPACE_ID} bundle exec jekyll contentful
bundle exec jekyll build

git --no-pager diff

echo '******************************************'

echo '*************************************************'
echo '**** Publish updated content to Github Pages ****'
echo '*************************************************'

git config --global user.email "jwrubel@gmail.com"
git config --global user.name "James Wrubel"

echo '**** Committing updated content ****'
git add .
git commit -m "Automated Publish"

echo '**** Pushing updated content to Github ****'
git push -f origin master

echo '*************************************************'
