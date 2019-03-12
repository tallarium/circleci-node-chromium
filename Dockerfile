FROM circleci/node:10-browsers

WORKDIR /home/circleci

RUN sudo npm install --global npm@6 && \
    curl "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F488525%2Fchrome-linux.zip?generation=1500599293181584&alt=media" -o chrome-linux.zip && \
    unzip chrome-linux && \
    rm chrome-linux.zip && \
    cp /opt/google/chrome/google-chrome chrome-linux/ && \
    sudo cp -T -R chrome-linux /opt/google/chrome && \
    rm -rf chrome-linux

# Reset back to original
WORKDIR /
