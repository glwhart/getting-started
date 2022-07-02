using Plots

g = 9.8 #gravity
l = 9.8 #pendulum length
N = 1500 #num time steps
delT = .04 #time step
Fd = 1.2 #Driving force (can vary between 0 and above 1 to see different results)
q = 1/2 #dissipation constant
wd = 2/3 #driving frequency

theta = Array{Float64, 1}(undef, N)
w = Array{Float64, 1}(undef, N)
t = Array{Float64, 1}(undef, N)

#update angular velocity and angle based on previous using euler-cromer
function f(T) 
    w[T+1] = w[T] - (((g/l)*sin(theta[T]) + q*w[T] - Fd*sin(wd*t[T]))*delT)
    theta[T+1] = theta[T] + w[T+1]*delT 
    #if theta is out of the bounds, reset it (if the pendulum swings up and over itself)
    theta[T+1] <= -pi ? theta[T+1] += 2*pi : theta[T+1]
    theta[T+1] >= pi ? theta[T+1] -= 2*pi : theta[T+1]
end

#initial conditions
theta[1] = .2
t[1] = 0
w[1] = 0

#run iterations
t = [i for i in 0:delT:(N-1)*delT]
[f(i) for i in 1:N-1] 

plot(theta, w, title = "Natural Pendulum", xlabel = "θ", ylabel = "ω",
annotation = (20, 1.5, "Driving Force = $Fd \n Driving Frequency = $wd"))