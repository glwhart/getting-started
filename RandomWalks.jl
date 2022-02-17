using Plots
global n = 0 #num steps
global t = 0 #num walkers
global d = 0 #num dimensions
global anim = Animation()

function one()
    x = rand(-1:1, t)
    counter = 1

    for j in 1:n
        display(histogram(x, 
        label = "Number of steps: $counter", 
        color = :green, 
        legend_background_color = :gold,
        legend_font_color = :black,
        xlims = (-(n^(2/3)), n^(2/3)), 
        ylims = (0, t/2), 
        #bar_width = 1,
        #aspect_ratio = 1,
        title = "Walker Position"))
        frame(anim)
        for i in 1:t
            test = rand((-1,1))
            if (test == 1) 
                x[i] += 1
            else 
                x[i] -= 1
            end
        end
        counter += 1
    end
    gif(anim)
end

function two()
    x = rand((-1,1), t)
    y = rand((-1,1), t)
    counter = 1

    for j in 1:n 
        for i in 1:t 
            test = rand((1:4))
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
        display(scatter(x,y, 
        label = "Number of Steps: $counter", 
        color = :turquoise, 
        legend_background_color = :green,
        legend_font_color = :white,
        aspect_ratio = 1,
        xlims = (-(n^(2/3)), n^(2/3)), 
        ylims = (-(n^(2/3)), n^(2/3)), 
        title = "Walker Position"))
        counter += 1 
        frame(anim)
    end

    gif(anim)
end

function three()
    x = rand((-1:1), t)
    y = rand((-1:1), t)
    z = rand((-1:1), t)
    counter = 1

    for j in 1:n 
        for i in 1:t 
            test = rand((1:6))
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
            elseif test == 6
                z[i] -= 1
            end
        end
        display(scatter(x,y,z, 
        label = "Number of steps: $counter", 
        legend_background_color = :turquoise, 
        legend_font_color = :black, 
        color = :orange, 
        aspect_ratio = 1,
        xlims = (-(n^(3/5)), n^(3/5)), 
        ylims = (-(n^(3/5)), n^(3/5)), 
        zlims = (-(n^(3/5)), n^(3/5)), 
        title = "Walker Position"))
        counter += 1
        frame(anim)
    end

    gif(anim)
end

function RandomWalk(arg1::Integer, arg2::Integer, arg3::Integer) 
    global n = arg1
    global t = arg2
    global d = arg3

    if n == 0 || t == 0 || d == 0
        println("failed")
    elseif d == 1
        one()
    elseif d == 2
        two()
    else
        three()
    end
    println("Have a nice day!")
end