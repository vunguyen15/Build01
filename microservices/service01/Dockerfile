FROM public.ecr.aws/sam/build-python3.8:1.52.0-20220610003848
ENV TZ="Asia/Ho_Chi_Minh"

RUN mkdir /code
WORKDIR /code

ADD  . .
COPY . .

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]