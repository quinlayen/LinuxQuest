FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash \
    coreutils \
    software-properties-common \
    sudo \
    zip \
    bat

# Create main user for the game
RUN useradd -m detective && \
    echo "detective:detective" | chpasswd && \
    adduser detective sudo

# Create groups to be used in game
RUN groupadd CodeCrakers && \
    groupadd ShadowSeekers && \
    groupadd DataSleuths && \
    groupadd CipherAgents

# Environment variables
ENV LEVEL1_FIRST_VISIT=true
ENV LEVEL2_FIRST_VISIT=true
ENV LEVEL3_FIRST_VISIT=true
ENV LEVEL4_FIRST_VISIT=true
ENV LEVEL5_FIRST_VISIT=true
ENV LEVEL6_FIRST_VISIT=true
ENV LEVEL7_FIRST_VISIT=true
ENV LEVEL8_FIRST_VISIT=true
ENV LEVEL9_FIRST_VISIT=true
ENV LEVEL10_FIRST_VISIT=true

WORKDIR /LinuxQuest

COPY . /LinuxQuest

RUN chown -R detective:detective /LinuxQuest

RUN echo 'source /LinuxQuest/welcome_trigger.sh' >> /LinuxQuest/.bashrc

USER detective

CMD batcat README.md && /bin/bash