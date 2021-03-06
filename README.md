<p align="center">
  <img src="./images/browser_README_450dpi.png" alt="Phishing: how not to get 'caught'?">
</p>

# Phishing: how not to get "caught"?

*By Vitalii Morskyi & Julia Makarska*

The phenomenon of phishing has been around for many years. However, the last year has shown how important internet security is among other things. Over a year ago, the world stopped: everybody and everything was moved to the Internet. That motivated us to analyse the topic of Phishing. Phishers usually use email or SMS messages to deceive users and force to act according to their expectations. The key points we want to emphasize in our research are how easy it is to get tricked and what are the common properties of malicious URLs. The aspects we analyzed cover only a small piece of this cheating method, however we found the results to be interesting, and hope you will as well. At the same time, this file is more about recreating the steps of our analysis, not reporting the final results. However, if you are interested in the latter one, please checkout the [`demonstration`](https://github.com/FrightenedFox/r-lab-project/tree/main/demonstration) folder or the [`data-visualization.\*`](https://github.com/FrightenedFox/r-lab-project/blob/main/data-visualization.pdf) files. 

This project is a part of the curriculum in *"Programming in R"* of the Rzeszow University of Technology, Poland.

## Setting up the environment

The main analysis is conducted by using **Jupyter Notebook** which is usually used with Python, but also supports R.  
So, to get things work properly, you would have to install some R and Python packages.

### Python modules

First of all, you need [Python](https://www.python.org/downloads/) 3.5 or greater. Next, you are expected to install `JupyterLab` and `r-essentials` modules. 

#### Using [`conda`](https://docs.conda.io/en/latest/miniconda.html)

 - JupyterLab:

	```bash
	conda install -c conda-forge jupyterlab
	```

 - R-essentials:

 	```bash
 	conda install -c r r-essentials 
 	```

#### Using `pip`

 - If you use `pip`, you can install JupyterLab with:

 	```bash
 	pip install jupyterlab
 	```
 - Unfortunately **there is no way of installing `r-essentials` using `pip`.**

For more ways of installing `JupyterLab` please checkout [this page](https://jupyterlab.readthedocs.io/en/stable/getting_started/installation.html).

### Running the JupyterLab environment

Assuming R-essentials are installed, you can use one of the following commands to open JupyterLab environment:

```bash
jupyter-lab
```

or 

```bash
python -m jupyter-lab
```

If everything has been installed correctly, then webpage similar to the one shown on the image below should appear in your default browser. 

<p align="center">
  <img src="./images/README_JupyterLab_450pdi.png" alt="Example of the JupyterLab environment">
</p>

### R packages

To install all required packages, please open `R Console` in the JupyterLab tab and execute the following piece of code:

```R
install.packages("stringi")
install.packages("stringr")
install.packages("lattice")
install.packages("ggplot2")
install.packages("ggExtra")
install.packages("hrbrthemes")
install.packages("rgl")
install.packages("GGally")
```

Note: if any problems occur while installing those packages, try creating a separate `Conda Environment` specifically for this project. To do so, you can use `conda create --name EnvironmentName jupyterlab r-essentials` command. To activate your environment, use the following command: `conda activate EnvironmentName`. Now you can continue from the step <a href="#running-the-jupyterlab-environment"><em>Running the JupyterLab environment</em></a>. You can find out more about `Conda Environments` on their [official documentation page](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html).

If there were no problems with installing modules, you are ready to go. You can start from opening the file `data-visualization.ipynb` by clicking on it's icon on the side bar. 

## References

### Data sets:
- [PhishTank](https://research.aalto.fi/en/datasets/phishstorm-phishing-legitimate-url-dataset)
- [MendeleyData](https://data.mendeley.com/datasets/gdx3pkwp47/2)

### Used articles: 
- [*Malicious URL Filtering ??? A Big Data Application*](https://www.semanticscholar.org/paper/Malicious-URL-filtering-%E2%80%94-A-big-data-application-Lin-Chiu/c46092506e36d8d5e4bea3c7bf507b2bb3c079d1#paper-header)
- [*Phishing detection based Associative Classification data mining*](https://www.sciencedirect.com/science/article/abs/pii/S0957417414001481?via%3Dihub)

### Theory behind the scenes: 
- [CERT Polska : Lista ostrze??e?? przed niebezpiecznymi stronami](https://cert.pl/posts/2020/03/ostrzezenia_phishing/)
- [Uniform Resource Identifier](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier)
- [Czym jest PHISHING](https://www.gov.pl/web/baza-wiedzy/)czym-jest-phishing-i-jak-nie-dac-sie-nabrac-na-podejrzane-widomosci-e-mail-oraz-sms-y
- [Kontrolowany atak PHISHINGOWY](https://phishing.opcja.pl/)

### Documentations and code examples:
- [R documentation](https://www.rdocumentation.org/)
- [StackOverflow](https://stackoverflow.com/)
- [R & Python Graph Gallery](https://www.r-graph-gallery.com/about.html)
- [ggpairs function](https://ggobi.github.io/ggally/reference/ggpairs.html)

### Icons and poster: 
- [Free SVG](https://freesvg.org/)
- [Canva](https://www.canva.com/)
- [Pixel perfect](https://www.flaticon.com/authors/pixel-perfect), [Freepik](https://www.freepik.com), [Becris](https://creativemarket.com/Becris), [bqlqn](https://www.flaticon.com/authors/bqlqn)  from [Flaticon](https://www.flaticon.com/)

---

<p align="center">
  <img src="./images/README_poster_450pdi.png" alt="Poster of the project">
</p>
