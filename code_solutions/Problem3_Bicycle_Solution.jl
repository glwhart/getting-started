using Plots

P = 400 #power (Watts)
m = 70 #mass (kg)
ΔT = .1 #time step (sec)
v0 = 0 #initial velocity (m/s)
N = 1000 #num time steps
C = 1 #drag constant
ρ = 1.225 #density of air 
A = .33 #frontal area of bike
F0 = P/7 #=inital force that is constant and corresponds to arround 
twice the force exerted by the rider at full power, this is in order to 
get the bike moving initially=#

t = Array{Float64}(undef, N) #time array
v1 = Array{Float64}(undef, N) #no air resistance
v2 = Array{Float64}(undef, N) #air resistance
#initialize the starting velocities and time
v1[1] = v0 
v2[1] = v0 
t[1] = 0

for i in 1:(N-1)
    #=if the power calculated from the constant initial force and the current velocity
    is greater than our constant Power, calculate next velocity according to our constant
    power, else calculate next velocity based on the constant initial force=#
    if F0*v1[i] >= P && F0*v2[i] >= P
        v1[i+1] = v1[i] + (P/(m*v1[i]))*ΔT
        v2[i+1] = v2[i] + (P/(m*v2[i]))*ΔT - ((C*ρ*A*v2[i]^2)/(2*m))*ΔT
    else
        v1[i+1] = v1[i] + (F0/m)*ΔT
        v2[i+1] = v2[i] + (F0/m)*ΔT - ((C*ρ*A*v2[i]^2)/(2*m))*ΔT
    end
    t[i+1] = t[i] + ΔT #increment time based upon time step
end

plot(t, v1, label = "Without air resistance", title = "Bicycle Motion", ylabel = "Velocity (m/s)", xlabel = "Time (sec)", asepct_ratio = 1)
plot!(t, v2, label = "With air resistance")