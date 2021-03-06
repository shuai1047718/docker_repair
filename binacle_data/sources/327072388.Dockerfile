FROM microsoft/dotnet:2.1-runtime-alpine

WORKDIR /opt

RUN mkdir pmcenter \
    && cd pmcenter \
    && wget https://ci.appveyor.com/api/projects/Elepover/pmcenter/artifacts/pmcenter.zip \
    && unzip pmcenter.zip \
    && rm pmcenter.zip \
    && wget https://raw.githubusercontent.com/Elepover/pmcenter/master/locales/pmcenter_locale_zh.meow.json -O /opt/pmcenter/pmcenter_locale.json

CMD ["dotnet","/opt/pmcenter/pmcenter.dll"]
