stratum0beamer
==============

Stratum 0 LaTeX beamer template with font support

# How to start?

Look into `./examples` to see how to use stratum0beamer.


## Options

 * `stratum0`: Stratum 0 variant (default)
 * `stratumauhuur`: Stratum Auhuur variant
 * `freifunk`: Freifunk Braunschweig variant
 * `coderdojo`: CoderDojoBS variant
 * `tocinheader`: shows table of contents (sections) in the header


# Installation

## Requirements Ubuntu

	sudo apt-get install curl unzip latex-beamer texlive-base texlive-binaries texlive-fonts-extra texlive-fonts-recommended texlive-lang-german texlive-latex-base texlive-latex-extra

	
## Requirements OS X

Install [MacTeX](https://tug.org/mactex/)


## Install stratum0beamer

run install.sh (will ask for root via sudo)

	git clone https://github.com/stratum0/stratum0beamer
	cd stratum0beamer
	./install.sh

or

	curl https://raw.githubusercontent.com/stratum0/stratum0beamer/develop/install.sh | sh
	
now you are ready to use stratum0beamer!



# Build from repository

## Requirements Ubuntu
	sudo apt-get install lcdf-typetools
	
	
## Build stratum0beamer
	./gen_dist.sh