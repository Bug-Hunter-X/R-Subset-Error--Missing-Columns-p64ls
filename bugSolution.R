```R
# Solution using dplyr:
library(dplyr)

data <- data.frame(A = 1:3, B = 4:6, C = 7:9)
cols <- c("A", "B", "D")

subset <- data %>% select(all_of(cols))
#If you want to keep only existing columns, and ignore non-existing ones:
#subset <- data %>% select(any_of(cols))

# Solution using base R (with error handling):

data <- data.frame(A = 1:3, B = 4:6, C = 7:9)
cols <- c("A", "B", "D")

#Check if all columns exists, and subset accordingly
existing_cols <- intersect(cols, names(data))
if(length(existing_cols) > 0) {
subset <- data[, existing_cols, drop = FALSE] #drop = FALSE to avoid converting to vector when 1 column is selected.
} else {
  subset <- data.frame() #return empty dataframe if none exist
  warning("None of the specified columns exist in the data frame.")
}

print(subset)
```