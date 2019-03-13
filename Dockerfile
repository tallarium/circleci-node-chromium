FROM circleci/node:10-browsers

WORKDIR /home/circleci

RUN sudo npm install --global npm@6

RUN curl "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F488525%2Fchrome-linux.zip?generation=1500599293181584&alt=media" -o chrome-linux.zip

RUN unzip chrome-linux && \
    rm chrome-linux.zip && \
    sudo rm /usr/bin/google-chrome && \
    sudo ln -s /home/circleci/chrome-linux/chrome /usr/bin/google-chrome

# Reset back to original
WORKDIR /
