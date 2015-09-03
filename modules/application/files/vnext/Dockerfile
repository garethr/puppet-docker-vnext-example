FROM microsoft/aspnet

COPY . /app
WORKDIR /app
ENV MONO_THREADS_PER_CPU 2000
RUN ["dnu", "restore"]

EXPOSE 5004
ENTRYPOINT ["dnx", "kestrel"]
