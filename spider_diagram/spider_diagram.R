install.packages("devtools")
devtools::install_github("ricardo-bion/ggradar")

data(msleep, package="ggplot2")
print(msleep)



# create a radar chart

# prepare data
data(msleep, package = "ggplot2")
library(ggradar)
library(scales)
library(dplyr)

plotdata <- msleep %>%
  filter(name %in% c("Cow", "Dog", "Pig")) %>%
  select(name, sleep_total, sleep_rem, 
         sleep_cycle, brainwt, bodywt) %>%
  rename(group = name) %>%
  mutate_at(vars(-group),
            funs(rescale))
plotdata

# generate radar chart
ggradar(plotdata, 
        grid.label.size = 4,
        axis.label.size = 4, 
        group.point.size = 5,
        group.line.width = 1.5,
        legend.text.size= 10) +
  labs(title = "Mammals, size, and sleep")

