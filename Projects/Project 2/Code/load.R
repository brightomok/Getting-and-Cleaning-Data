train_names <- list.files("train/Inertial Signals")
train_paths <- paste("train/Inertial Signals/", train_names, sep ="")

test_names <- list.files("test/Inertial Signals")
test_paths <- paste("test/Inertial Signals/", test_names, sep ="")

all_paths <- c(train_paths, test_paths)

print length(all_names)

all_list <- lapply(all_paths, read.table)