library(Superpower)
set.seed(2022)
mu <- c(-0.25, 0.25, 0.25, -0.25) #Cohen's f expected to be 0.25
n <- 17 #Number of participants suggested by plotting
sd <- 1 #Typical parameters
r <- 0.5 #Typical parameters
string = "2w*2b" # 2 within x 2 between subjects
alpha_lev <- 0.05 #Desired alpha level
labelnames = c("age", "old", "young", "alpha", "low", "high") #Condition names


design_result <- ANOVA_design( #Design is compiled
  design = string,
  n = n,
  mu = mu,
  sd = sd,
  r = r,
  labelnames = labelnames
)



plot_power(design_result, min_n = 10, max_n = 250, desired_power = 80) # A simulation is run, the generated plot shows the cut-off point

simulation_result <- ANOVA_power(design_result,  #Simulation is confirmed 100x with n set to 17
                                 alpha_level = alpha_lev, 
                                 nsims = 100,
                                 verbose = FALSE,
                                 seed = 2022)



simulation_result

final_power <- simulation_result[["main_results"]][["power"]][3]

final_power #This is the power value found with n at 17
