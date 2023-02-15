FROM python:3.8

WORKDIR /notebook/

RUN pip install jupyter jupyterlab ipykernel notebook

COPY . ./notebook

EXPOSE 8888

CMD ["jupyter", "notebook", "--port=8888", "--ip=0.0.0.0", "--allow-root"]