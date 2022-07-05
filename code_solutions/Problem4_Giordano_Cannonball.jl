using Plots

N = 10000 #num time steps
ΔT = .1 #time step
C = 1 #drag constant
ρ0 = 1.225  #density of air at sea level
A = π*(.1^2) #frontal area of cannonball
m = 20#cannonball mass
g = 9.8 #gravitational acceleration

Xx = Array{Float64, 1}(undef, N) #x position
Xy = Array{Float64, 1}(undef, N) #y position
X = Array{Float64, 1}(undef, N) #without air resistance
Y = Array{Float64, 1}(undef, N) #w/out air resistance
x = Array{Float64, 1}(undef, N) #no density correction
y = Array{Float64,1}(undef, N) #no density correction

#initalize starting position/velocites
Xx[1] = 0
Xy[1] = 0
X[1] = 0
Y[1] = 0
x[1] = 0
y[1] = 0
Vxx = 500 #starting xvelocity w/out drag
Vyy = 600 #starting yvelocity w/out drag
Vx = 500 #starting velocity with drag
Vy = 600 #starting velocity with drag
vx = 500 #no density correction
vy = 600 #no density correction
angle = round(atan(Vyy, Vxx)*(180/pi), digits = 2)

for i in 1:(N-1)
    #update density based on adiabatic expansion of air in troposphere 
    global ρ = ρ0*(1- (6.5*13^-3*Xy[i])/288.15)^2.5
    global B = C*ρ*A/2 #drag coefficient
    global B1 = C*ρ0*A/2

    #update position based on x and y velocities
    Xx[i+1] = Xx[i] + Vx*ΔT
    Xy[i+1] = Xy[i] + Vy*ΔT
    X[i+1] = X[i] + Vxx*ΔT
    Y[i+1] = Y[i] + Vyy*ΔT
    x[i+1] = x[i] + vx*ΔT
    y[i+1] = y[i] + vy*ΔT

    #check if the ball has hit the ground (if y position is less than 0)
    if Xy[i+1] <= 0
        #interpolate ending x position
        r = -Xy[i]/Xy[i+1]
        Xy[i+1] = 0
        Xx[i+1] = (Xx[i] + r*Xx[i+1])/(r + 1)
        Y[i+1] = 0
        X[i+1] = X[i] + (X[i+1] - X[i])/2
        y[i+1] = 0
        x[i+1] = x[i] + (x[i+1] - x[i])/2
        #save index so the rest of the array can be removed 
        global stop = i
        break
    else
        #calculate drag force based on drag constant and velocities
        Fx = (-B/m)*sqrt(Vx^2 + Vy^2)*Vx
        Fy = (-B/m)*sqrt(Vx^2 + Vy^2)*Vy
        fx = (-B1/m)*sqrt(vx^2 + vy^2)*Vx
        fy = (-B1/m)*sqrt(vx^2 + vy^2)*Vy
        
        #update velocites based on drag force
        global Vx = Vx + (Fx/m)*ΔT
        global Vy = Vy + (-g + Fy/m)*ΔT
        global vx = vx + (fx/m)*ΔT
        global vy = vy + (-g + fy/m)*ΔT

        #update velocities with no drag force
        global Vxx = Vxx
        global Vyy = Vyy - g*ΔT
    end
end

#remove unneccessary parts of arrays 
for i in stop:N-1
    pop!(Xy)
    pop!(Xx)
    pop!(X)
    pop!(Y)
    pop!(y)
    pop!(x)
end

plot(Xx, Xy, label = "With Drag", title = "Cannonball Trajectory", xlabel = "Distance", ylabel = "Height", aspect_ratio = 1, annotation = (last(Xx)/2, Xy[trunc(Int, length(Xy)/2)]/2, "Angle = $angle degrees"))
plot!(X, Y, xlims = (0, last(Xx)), ylims = (0, maximum(Y)), label = "Without Drag")
plot!(x,y, label = "Without Density Correction")
