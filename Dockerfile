# jenkinsから取得
FROM jenkins/jenkins:2.491-jdk21

# 以下rootで実行
USER root

# 必要なパッケージインストール
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y vim

# jenkinsユーザーをsudoersに追加
RUN gpasswd -a jenkins sudo

# jenkinsのパスワード変更
RUN echo jenkins:jenkins | chpasswd

USER jenkins
