# GA-Contentful
A microsite for lecture content. Implemented in jekyll on Github Pages, with data pulled from Contentful. The project uses CircleCI to listen for changes to the data in Contentful and rebuild and deploy the site to Github when there is an update. The CircleCI config file at `.circleci/config.yml` calls a custom deploy script at `./bin/deploy.sh` which pulls Contentful data, runs a jekyll build, and commits that to the `gh-pages` branch and pushes to github.

## Getting started

You can always pull the latest from Contentful if you are developing locally. You'll need the project access token and Space ID. You should set these locally as environment variables named CONTENTFUL_ACCESS_TOKEN and CONTENTFUL_SPACE_ID.

## Development

The site uses jekyll, and really only has two html pages plus some includes. The main template is at `index.html` and the lecture video template is at `_layouts/lecture.html`. It is used to generate static pages for all the lectures using the [jekyll-datapage-gen](https://github.com/avillafiorita/jekyll-datapage_gen) plugin.

## Publishing new content

This site uses Github pages (on the `gh-pages` branch). If you are making changes to the code, make a pull request against the `master` branch. Once it is merged, push to production. This should trigger a rebuild in CircleCI.

### Lectures
To publish a new lecture video, you need to unzip the video directory. Take the entire folder from the zip file and add it to github in the `/videos` directory, and commit it to the `master` branch. Once you have done this, you can create the entry in Contentful. For the field `Video Link` in Contentful, you need to find the relative path to the video. However if there are spaces or special characters in the folder name, those need to be converted to URL format. The easiest thing to do is go to the folder and launch the file `story.html` in a browser. The path should be something like `/videos/[FOLDER_NAME]/story_html5.html`. Copy the part that is just the folder name (between the `/videos/` and `/story_html5.html`). The final path to your video needs to be `../videos/[FOLDER_NAME_YOU_COPIED]/story_html5.html`. Contentful will give you a warning if it is not in the correct format.

## Troubleshooting
