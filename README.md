# ga-contentful
testing integration between jekyll and contentful

## Publishing new content

### Lectures
To publish a new lecture video, you need to unzip the video directory. Take the entire folder from the zip file and add it to github in the `/videos` directory, and commit it to the `master` branch. Once you have done this, you can create the entry in Contentful. For the field `Video Link` in Contentful, you need to find the relative path to the video. However if there are spaces or special characters in the folder name, those need to be converted to URL format. The easiest thing to do is go to the folder and launch the file `story.html` in a browser. The path should be something like `/videos/[FOLDER_NAME]/story_html5.html`. Copy the part that is just the folder name (between the `/videos/` and `/story_html5.html`). The final path to your video needs to be `../videos/[FOLDER_NAME_YOU_COPIED]/story_html5.html`. Contentful will give you a warning if it is not in the correct format.
