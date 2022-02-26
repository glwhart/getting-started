using Plots 
using Statistics
using StatsPlots
using Distributions
using LinearAlgebra
using KernelDensity
using MultiKDE

global dim = 0  # number of dimenstions 
global n = 0    # number of steps
global t = 0    # number of walkers
anim = Animation()


# funcation for 1d randomwalk 
function one()
    A = rand((-1:1), t)
    function hist()
        density(vec(A),legend=:none, xlims=(-n^(2/3),n^(2/3)), ylims=(0,.1))
        frame(anim)

        
    end
    
    for j in 1:n
        hist()
        for i in 1:t
            x = rand((-1,1))
            if x == 1
                A[i] += 1
            else
                A[i] -= 1
            end
        end
        println("Number of steps taken: ", j)
        println("The standard deviation is: ", std(A))
    end

    gif(anim)
end
# function for 2d randomwalk
function two()
    x = rand((-1.0,1.0),t)
    y = rand((-1.0,1.0),t)
    
    for j in 1:n
        for i in 1:t
            test = rand(1:4)
            if test == 1
                x[i] += 1
            elseif test == 2
                x[i] -= 1
            elseif test == 3
                y[i] += 1
            else 
                y[i] -= 1
            end
        end
       plot(kde((x,y)), xlims= (-n^(2/3),n^(2/3)), ylims= (-n^(2/3),n^(2/3)),aspect_ratio=1)

        println("Number of steps taken: ", j)
        println("The standard deviation in the x is: ", std(x))
        println("The standard deviation in the y is: ", std(y))
        frame(anim)
    end

    gif(anim)
end

#function for 3d randomwalk 
function three()
    x = rand((-1,1),t)
    y = rand((-1,1),t)
    z = rand((-1,1),t)
    for j in 1:n
        for i in 1:t
            test = rand(1:6)
            if test == 1
                x[i] += 1
            elseif test == 2
                x[i] -= 1
            elseif test == 3
                y[i] += 1
            elseif test == 4
                y[i] -= 1
            elseif test == 5
                z[i] += 1
            else 
                z[i] -= 1
            end
        end
        display(scatter(x,y,z,legend=:none, xlims=(-100,100), ylims= (-100,100), zlims=(-100,100), title = "Walker Position"))

        println("Number of steps taken: ",j)
        println("The Standard deviation in the x is: ",std(x) )
        println("The Standard deviation in the y is: ",std(y))
        println("The Standard deviation in the z is: ", std(z))
        frame(anim)
    end

    gif(anim)
end
# function for user input ot pick which function to use
function randomwalk(a,b,c)
    global dim = a
    global t = b
    global n = c
    if dim == 1
        one()
    elseif dim == 2
        two()
    elseif dim == 3
        three()
    end
end




