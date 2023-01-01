FROM python:3.7

WORKDIR /src

COPY ./src/requirements.txt ./

RUN pip install --no-cache-dir gunicorn
RUN pip install --no-cache-dir -r requirements.txt

RUN rm requirements.txt

RUN curl -fsSL https://get.docker.com | sh

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# Uncomment the following if using older openra versions that require mono
#RUN apt update
#RUN apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common -y
#RUN apt-add-repository 'deb https://download.mono-project.com/repo/ubuntu stable-focal main'
#RUN apt install mono-complete -y
