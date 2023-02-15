FROM python:3.8

ADD . /notebook

WORKDIR /notebook/

RUN pip install jupyter notebook

EXPOSE 8888

CMD ["jupyter", "notebook", "--port=8888", "--ip=0.0.0.0", "--allow-root"]