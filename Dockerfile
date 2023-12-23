FROM perl:5.30.2

WORKDIR /usr/src/app

# COPY cpanfile* ./

# COPY app.conf . 

RUN cpan -i App::cpanminus

# RUN cpanm --installdeps .

RUN cpanm Mojolicious DBD::SQLite

RUN cpanm Mojo::SQLite

##RUN cpanm DBD::Pg DBIx::Class::Schema::Loader

##RUN cpanm Mojo::Pg


COPY . .

EXPOSE 3000

CMD ["morbo", "./script/projectmanager"]