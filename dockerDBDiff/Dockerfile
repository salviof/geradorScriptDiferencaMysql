FROM fedora:30

MAINTAINER salviof@gmail.com coletivojava.com.br



#COPY mysql57-community-release-el7-9.noarch.rpm mysql57-community-release-el7-9.noarch.rpm



#RUN yum install epel-release -y
RUN sudo dnf install passenger -y
RUN yum update -y
RUN dnf install git -y
COPY ./instalacao.sh /bin/instalacao.sh
COPY composer.phar /bin/composer.phar

RUN  mkdir /home/superBits/devTools/ -p
RUN  git clone https://github.com/salviof/DBDiff.git
RUN mv ./DBDiff /home/superBits/devTools/ -f

WORKDIR /home/superBits/
RUN git clone https://github.com/salviof/superBitsDevOps.git

RUN dnf install sudo -y
#RUN sudo rpm -ivh mysql57-community-release-el7-9.noarch.rpm
#RUN sudo yum -y install  mysql-server 

RUN sudo yum install composer -y


#RUN sudo yum install xmlstarlet -y





COPY composer.phar /home/superBits/devTools/DBDiff/composer.phar
COPY gerarScript.sh /home/superBits/devTools/DBDiff/gerarScript.sh
COPY testeSimples.sh /home/superBits/devTools/DBDiff/testeSimples.sh

RUN chmod +x /bin/instalacao.sh /bin/composer.phar /home/superBits/devTools/DBDiff/testeSimples.sh
RUN  mkdir /home/superBits/devTools/DBDiff/referencia -p
RUN  mkdir /home/superBits/devTools/DBDiff/novoBanco -p
WORKDIR /home/superBits/devTools/DBDiff/

#RUN composer install
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'baf1608c33254d00611ac1705c1d9958c817a1a33bce370c0595974b342601bd80b92a3f46067da89e3b06bff421f182') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
#RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN sudo dnf install php-mysqli -y
WORKDIR /home/superBits/devTools/DBDiff/
#RUN php composer.phar install  --prefer-dist 
ENTRYPOINT ["/bin/bash","/home/superBits/devTools/DBDiff/testeSimples.sh"]

