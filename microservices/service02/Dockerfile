FROM public.ecr.aws/sam/build-python3.8:1.52.0-20220610003848
ENV TZ="Asia/Ho_Chi_Minh"

RUN mkdir /code
WORKDIR /code

ADD  microservices/service02 .
COPY microservices/service02 .

RUN pip install -U pip
RUN pip install -r requirements.txt

EXPOSE 5000
