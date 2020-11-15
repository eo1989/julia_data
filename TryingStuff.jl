using LsqFit, CSV, Plots 

# *** Fit Volumes to logistic model ***

@. model(age, pars) = pars[1] / (1 + exp(-pars[2] * (age - pars[3])))

obsVols = CSV.read(IOBuffer("""
age  vol
20   56 
35   140
60   301
90   420
145  502
"""), delim=" ", ignorerepeated=true, copycols=true)

par0 = [600, 0.02, 60]

fit = curve_fit(model, obsVols.age, obsVols.vol, par0)

fit.param = [497.07, 0.05, 53.5]
fitX = 0:maximum(obsVols.age)*1.2
fitY = [fit.param[1] / (1 + exp(-fit.param[2] * (x - fit.param[3]))) for x in fitX]

plot(fitX, fitY, seriestype=:line, label = "Fitted values")
plot!(obsVols.age, obsVols.vol, seriestype = :scatter, label = "Obs values")
plot!(obsVols.age, fit.resid, seriestype=:bar, label = "Residuals")
