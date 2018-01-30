FROM ubuntu:16.04
USER root

RUN apt-get update
RUN apt-get install -y python 
RUN apt-get install -y python-pip
RUN pip install toolium
RUN pip install behave==1.2.5

#install miscs
RUN apt-get update
RUN apt-get install -y unzip openjdk-8-jre-headless xvfb libxi6 libgconf-2-4
RUN apt-get -y install wget
RUN apt-get install -y fonts-liberation
RUN apt-get install -y libappindicator1
RUN apt-get install -y libasound2
RUN apt-get install -y libatk-bridge2.0-0
RUN apt-get install -y libatk1.0.0
RUN apt-get install -y libcairo2
RUN apt-get install -y libgtk-3-0
RUN apt-get install -y libpango-1.0-0
RUN apt-get install -y libxss1
RUN apt-get install -y lsb-release
RUN apt-get install -y xdg-utils

# Install Chrome
RUN wget -N https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb
RUN apt-get install -y -f
RUN rm -Rf google-chrome-stable_current_amd64.deb

# Install ChromeDriver.
RUN wget -N https://chromedriver.storage.googleapis.com/index.html?path=2.35/chromedriver_linux64.zip
RUN unzip ~/chromedriver_linux64.zip -d ~/
RUN rm ~/chromedriver_linux64.zip
RUN mv -f ~/chromedriver /usr/local/bin/chromedriver
RUN chown root:root /usr/local/bin/chromedriver
RUN chmod 0755 /usr/local/bin/chromedriver
