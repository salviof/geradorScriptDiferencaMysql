FROM fedora:30
MAINTAINER salviof@gmail.com coletivojava.com.br
#RUN sudo dnf install passenger -y
RUN yum update -y
RUN dnf install git -y
RUN yum install mysql -y
RUN  mkdir /home/superBits/devTools/ -p
WORKDIR /home/superBits/
RUN git clone https://github.com/salviof/superBitsDevOps.git
WORKDIR /home/superBits/devTools/
RUN git clone https://github.com/DBDiff/DBDiff.git
RUN yum install php -y
RUN dnf install php-mysqli
RUN sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ /etc/php.ini
COPY ./composer.phar /home/superBits/devTools/DBDiff/composer.phar
COPY ./config.conf /home/superBits/devTools/DBDiff/config.conf
#COPY configPHPINI.conf /home/superBits/devTools/DBDiff/configPHPINI.temp
#RUN echo /home/superBits/devTools/DBDiff/configPHPINI.temp >> /etc/php.ini
WORKDIR /home/superBits/devTools/DBDiff/
RUN /home/superBits/devTools/DBDiff/build
RUN cp /home/superBits/devTools/DBDiff/dist/dbdiff.phar /usr/local/bin/dbdiff
RUN cp /home/superBits/devTools/DBDiff/dist/dbdiff.phar /home/superBits/devTools/DBDiff/
#RUN dnf install sudo -y
COPY gerarScript.sh /home/superBits/devTools/DBDiff/gerarScript.sh
RUN  yum install composer -y
WORKDIR /home/superBits/devTools/DBDiff/
RUN php composer.phar install
#RUN composer install
#ENTRYPOINT ["/bin/bash","/home/superBits/devTools/DBDiff/gerarScript.sh"]
#RUN sudo rpm -ivh mysql57-community-release-el7-9.noarch.rpm
#RUN sudo yum -y install  mysql-server 
#RUN sudo yum install xmlstarlet -y

COPY entrypoint.sh /home/superBits/devTools/DBDiff/
ENTRYPOINT ["/bin/bash","/home/superBits/devTools/DBDiff/entrypoint.sh"]
