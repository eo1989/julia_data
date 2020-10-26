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