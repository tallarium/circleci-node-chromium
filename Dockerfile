FROM circleci/node:12-browsers

WORKDIR /home/circleci

RUN sudo npm install --global npm@6

RUN curl "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F693954%2Fchrome-linux.zip?generation=1567721852304759&alt=media" -o chrome-linux.zip && \
    unzip chrome-linux && \
    rm chrome-linux.zip

RUN sudo rm /usr/bin/google-chrome && \
    sudo ln -s /home/circleci/chrome-linux/chrome /usr/bin/google-chrome

# Reset back to original
WORKDIR /
