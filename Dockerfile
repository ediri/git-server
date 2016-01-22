FROM centos:7
MAINTAINER ediri <social@ediri.de>

#RUN yum -y update
RUN yum -y install wget tar net-tools telnet openssh-server openssh-clients supervisor sudo ca-certificates passwd
RUN yum -y install git

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key


RUN mkdir /var/run/sshd

# Adding git user
RUN adduser git
RUN mkdir -p /home/git/.ssh

RUN echo "git:git" | chpasswd


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
