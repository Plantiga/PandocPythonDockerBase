FROM python:3.7-buster

RUN apt-get update -y && \
    apt-get install -y -o Acquire::Retries=10 --no-install-recommends \
    make \
    git \
    ca-certificates \
    locales \
    texlive-latex-base \
    texlive-xetex \
    texlive-latex-recommended \
    texlive-science \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    texlive-plain-generic \
    fontconfig \
    fonts-roboto \
    lmodern \
    latexmk \
    imagemagick \
    ghostscript && \
    apt-get autoclean && apt-get --purge --yes autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PANDOC_URL https://github.com/jgm/pandoc/releases/download/2.9.1.1/pandoc-2.9.1.1-1-amd64.deb
ENV PANDOC_SHA256 a9835933b9b7d0d827f77d2d9c3c1379545bba3b46b224f6af08775d3ccd6109

RUN set -ex; \
      \
      wget -O pandoc.deb "$PANDOC_URL"; \
      echo "$PANDOC_SHA256 *pandoc.deb" | sha256sum --check --strict -; \
      \
      dpkg -i pandoc.deb; \
      rm -f pandoc.deb
