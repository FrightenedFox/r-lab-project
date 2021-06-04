# Phishing: how not to get caught?

---

*By Vitalii Morskyi & Julia Makarska*

The phenomenon of phishing has been around for many years. However, the last year has shown how important internet security is among other things. Over a year ago the world stopped: everybody and everything was moved to the Internet. That motivated us to analyse the topic of Phishing. Usually phishers use email or SMS messages to deceive us and force us to act according to their expectations. The key points we want to emphasise in our research are how easy it is to get tricked and what are the common properties of malicious URLs. The aspects we analysed cover only a small piece of this cheating method, however we found the results to be interesting and hope you will as well. This file, however, is more about recreating the steps of our analysis, not reporting the final results. However, if you are interested in the latter one, please checkout the [demonstration folder](https://github.com/FrightenedFox/r-lab-project/tree/main/demonstration) or the [data-visualization.\* files](https://github.com/FrightenedFox/r-lab-project/blob/main/data-visualization.pdf). 


## Setting up the environment

---

The main analysis is made using **Jupyter Notebook** which is usually used with Python, but also supports R.  
So, to get things work properly, you would have to install some R and Python packages.

### Python modules

First of all you need [Python](https://www.python.org/downloads/) 3.5 or greater. Next you are expected to install `JupyterLab` and `r-essentials` modules. 

#### Using `conda`

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

### R packages

The following R packages are used in the project:

```R
install.packages("stringi")
install.packages("stringr")
install.packages("lattice")
install.packages("ggplot2")
install.packages("ggExtra")
install.packages("hrbrthemes")
install.packages("tidyverse")
install.packages("rgl")
```


## References

---

### Data sets:
- [PhishTank](https://research.aalto.fi/en/datasets/phishstorm-phishing-legitimate-url-dataset)
- [MendeleyData](https://data.mendeley.com/datasets/gdx3pkwp47/2)

### Used articles: 
- [*Malicious URL Filtering – A Big Data Application*](https://www.semanticscholar.org/paper/Malicious-URL-filtering-%E2%80%94-A-big-data-application-Lin-Chiu/c46092506e36d8d5e4bea3c7bf507b2bb3c079d1#paper-header)
- [*Phishing detection based Associative Classification data mining*](https://www.sciencedirect.com/science/article/abs/pii/S0957417414001481?via%3Dihub)

### Theory behind the scenes: 
- [CERT Polska : Lista ostrzeżeń przed niebezpiecznymi stronami](https://cert.pl/posts/2020/03/ostrzezenia_phishing/)
- [Uniform Resource Identifier](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier)

### Documentations and code examples:
- [R documentation](https://www.rdocumentation.org/)
- [StackOverflow](https://stackoverflow.com/)
- [R & Python Graph Gallery](https://www.r-graph-gallery.com/about.html)
