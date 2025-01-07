FROM jenkins/jenkins:2.491-jdk21

# 以下rootで実行
USER root

# 必要なパッケージインストール
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y vim

# Dockerインストール
RUN apt-get install ca-certificates curl
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc
RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    focal stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN apt-get install -y docker-ce-cli

# jenkinsユーザーをsudoersに追加
RUN gpasswd -a jenkins sudo

# jenkinsのパスワード変更
RUN echo jenkins:jenkins | chpasswd

USER jenkins
