using Plots

global walker = 0 
global n = 100 #numsteps
global t = 10 #numwalkers
global g = n+1
vals = [0]
global total = 0 
global totalsqr = 0

function f() 
    for i in 1:n
        test = rand(1:2)
        if (test == 1)
            global walker = walker - 1
        else 
            walker = walker + 1
        end
        push!(vals, walker)
    end
    global total = total + walker
    global totalsqr = totalsqr + (walker^2)
end

for i in 1:t
    global walker = 0; 
    f()
    local y = vals
    display(plot!(0:n, vals))
    splice!(vals, 2:g)
end

global avg = total/t 
println("the average x distance is ")
println(avg)
println()
println()

global avgsqr = sqrt(totalsqr/t)
println("the average x distance squared is ")
println(avgsqr)
