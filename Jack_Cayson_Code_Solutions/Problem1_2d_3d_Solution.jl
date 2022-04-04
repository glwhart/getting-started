using Plots

"""
Function to run random walk in 1 dimension
"""
function one(n, t, d)
    anim = Animation()
    x = rand(-1:1, t)
    counter = 1

    """
    Based on random integer, move the walker one of 2 directions. 
    Repeat for t amount of items in the array and for n number of steps. 
    """
    for j in 1:n
        display(histogram(vec(x), 
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

"""
Function to run the walk in 2 dimensions
"""
function two(n, t, d)
    anim = Animation()
    x = rand((-1,1), t)
    y = rand((-1,1), t)
    counter = 1

    """
    Based on random integer, move the walker one of 4 directions by incrementing either the x or y array. 
    Repeat for t amount of items in the arrays and for n number of steps. 
    """
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

"""
Function to run a random walk in 3 dimensions
"""
function three(n, t, d)
    anim = Animation()
    x = rand((-1:1), t)
    y = rand((-1:1), t)
    z = rand((-1:1), t)
    counter = 1

    """
    Based on random integer, move the walker one of 6 directions by incrementing either the x, y, or z array. 
    Repeat for t amount of items in the arrays and for n number of steps. 
    """
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

"""
Function called to run the program. Call RandomWalk(num steps, num walkers, num dimensions)
"""
function RandomWalk(arg1::Integer, arg2::Integer, arg3::Integer) 
    n = arg1
    t = arg2
    d = arg3

    if n == 0 || t == 0 || d == 0
        println("failed")
    elseif d == 1
        one(n, t, d)
    elseif d == 2
        two(n, t, d)
    else
        three(n, t, d)
    end
    println("Have a nice day!")
end
