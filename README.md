
# Welcome to the BYU Biophysics Group !
Here at the BYU Biophysics research group we are seeking to understand the fundamental systematic functions of the basic units of life through simplified computer simulations of real-life molecular behavior. We use computational modeling to better comprehend the physical principles at play in each of the many biological processes prokaryotic and eukaryotic cells undergo. We will be using the programming language Julia to run the simulations and create the models. Our end goal is to contribute to the general knowledge of human function and thus make medical treatment and health a reality for more people. Below you will find all the information you need to get started! 

# Getting Started with Biology
Here are some amazing papers and textbooks which will form the foundation to the sorts of questions and problebms we are working on solving! 
* [Escherichia coli Peptidoglycan Structure and Mechanics as Predicted by Atomic-Scale Simulations](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003475)
* [Coarse-Grained Molecular Dynamics Simulations of the Bacterial Cell Wall](https://www.researchgate.net/publication/304020343_Coarse-Grained_Molecular_Dynamics_Simulations_of_the_Bacterial_Cell_Wall)
* [Coarse-grained simulations of bacterial cell wall growth reveal that local coordination alone can be sufficient to maintain rod shape](https://www.pnas.org/content/112/28/E3689.long)
* [Simulations of Proposed Mechanisms of FtsZ-Driven Cell Constriction](https://journals.asm.org/doi/10.1128/JB.00576-20)
* [Random walks in Biology by Howard c. Berg](https://press.princeton.edu/books/paperback/9780691000640/random-walks-in-biology)
* [Microcosm: E.Coli and the new science of life by Carl Zimmer](https://www.amazon.com/Microcosm-Coli-Science-Life/dp/0307276864/ref=asc_df_0307276864/?tag=hyprod-20&linkCode=df0&hvadid=266033622375&hvpos=&hvnetw=g&hvrand=7949759552210628870&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9029858&hvtargid=pla-529339927612&psc=1)
* [Physical Biology of the Cell by Rob Phillips](https://www.amazon.com/Physical-Biology-Cell-Rob-Phillips/dp/0815344503/ref=sr_1_1?gclid=CjwKCAjwloCSBhAeEiwA3hVo_Z_QGpY5HKXNcUuloiPCHinDh-dNL-LtrzsACZaicseqIxA1a1vuKhoC6QEQAvD_BwE&hvadid=241627101117&hvdev=c&hvlocphy=9029858&hvnetw=g&hvqmt=e&hvrand=626376698173270681&hvtargid=kwd-10715236319&hydadcr=3208_10392132&keywords=physical+biology+of+the+cell&qid=1648415021&s=books&sr=1-1)  
* [Physical Models of Living Systems by Philip Nelson](https://www.physics.upenn.edu/biophys/PMLS2e/index.html)
* [Biological Physics by Philip Nelson](https://www.physics.upenn.edu/biophys/BPse/)

Here are some wonderful lectures and prestantions about various topics in biophisycal modeling
* [James C Gumbart](https://www.youtube.com/watch?v=tp-FPanCaWM)
* [Grant J Jensen](https://www.youtube.com/watch?v=FSOrXcWOMJU)
* [Sven Van Teffelen](https://www.youtube.com/watch?v=oYY03X2mZgw)
* [Cecile Morlot](https://www.youtube.com/watch?v=71c3rET3qAI&feature=youtu.be)
* [Bart Hoogenboom](https://www.youtube.com/watch?v=y-I0thStOv0)
* [Seamus Holden](https://www.youtube.com/watch?v=7GP5zZyTRPY)



# Getting Started with GitHub
If you are unfamiliar with GitHub or how it works, in this section you will find helpful tips and terminal commands to be able to perform the basic git commands that will be necessary for us to share code and findings. 
* Check out this [GitHub Tutorial Video](https://www.youtube.com/watch?v=DVRQoVRzMIY&list=WL&index=20&t=513s) for help understanding the basics.

# Getting Started with learning Julia
As mentioned above we have chosen to work in the Julia programing language! In this section you will find helpful tips and tricks to get you started in working with this powerful language! 
* Check out this [Julia tutorial](https://syl1.gitbook.io/julia-language-a-concise-tutorial/) for on help setting up Julia and VS code on your computer
* Check out this [Julia tutorial](https://www.youtube.com/watch?v=sE67bP2PnOo) for a great introduction to the basic syntax 
* Check out this [Julia tutorial](https://docs.juliaplots.org/latest/tutorial/) to learn how plots work in Julia
* Check out this helpful conversation [thread](https://stackoverflow.com/questions/58087096/a-plot-describing-the-density-of-data-points-in-2d-space-in-julia) on Kernel Density plotting in Julia
* Check out this helpful conversation [thread](https://discourse.julialang.org/t/plotting-single-density-plot-for-table/51962) about plotting single density plots for tables
* [Random walk Julia tutorial](https://sje30.github.io/catam-julia/casestudies/randomwalks/randomwalksnotebook.html)

# Getting Started with random walks 
A random walk is an extremely important concept in Biophysics and it will also be the first problem you will get to work on! 
## What is a random walk ?
* Check out this amazing [video](https://www.youtube.com/watch?v=stgYW6M5o4k) which helps explains the context around and the importance of random walks 
* Check out this amazing [video](https://www.youtube.com/watch?v=a3V0BJLIo_c) for an introduction to the diffusion equation
## Problem # 1
* Build a program using Julia which can simulate a random walk for t number of walkers each taking n number of steps. Plot the trajectory of the walkers in 1, 2 and 3 dimensions! Also see if you can plot the density distribution for each dimension! Feel free to compare your solution with Jack and Cayson's

## Problem # 2

* [2D Random walk](resources/SethnaStatMech_2Dwalk.pdf) problem from Jim Sethna's statistical mechanics book. This problem is insightful.


## Problem # 3

* [Bicycle Motion](resources/Chapter_2_Giordano.pdf) problem from Giordano's textbook, chapter 2 on realistic projectile motion. Helpful in beginning to understand the coding behind projectile motion. 

## Problem # 4

* [Cannonball Trajectory](resources/Chapter_2_Giordano.pdf) problem 2.2 from Giordano's textbook. Helpful in learning the dynamics of projectile motion in multiple dimensions. 
