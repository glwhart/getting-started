using Plots
using KernelDensity
using StatsPlots

n = 1000 #number of walkers
t = 1000 #number of steps

"Initialize arrays with dimensions n and t with random integers between 0 and 1/2"
array = rand(n,t).-.5
array2 = rand(n,t).-.5

"Sum the arrays in the vertical direction so as to simulate t number of steps"
xx = vcat(sum(array, dims = 2))
yy = vcat(sum(array2, dims = 2))

"Calculate the root mean square average in both the x and y directions"
rmsxx = sqrt(sum(abs.(xx).^2)/n)
println("RMS X = $rmsxx")
rmsyy = sqrt(sum(abs.(yy).^2)/n)
println("RMS Y = $rmsyy")

"Plot the resulting arrays as a kernel density function"
dens = kde((vec(xx),vec(yy)))
display(plot(dens, aspect_ratio = 1, title = "Walker Density Distribution", annotate = (0, -t^(2/5), "$n walkers taking $t steps \n RMSX = $rmsxx \n RMSY = $rmsyy")))