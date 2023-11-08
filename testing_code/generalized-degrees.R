# Author: Andrew Disher
# Date: 11/7/2023
# Addiliation: UMASSD

# --------------------
# ----- Packages -----
# --------------------

box::use(
  dplyr[`%>%`, filter, join_by, left_join, mutate, summarize]
)

# ------------------------------
# ----- Importing the Data -----
# ------------------------------

nodes <- read.csv(file = "data/cleaned_data/russel-nodes.csv")
edges <- read.csv(file = "data/cleaned_data/russel-edges.csv")
triangles <- read.csv(file = "data/cleaned_data/russel-triangles.csv")

# --------------------------------------------------
# ----- Generalized Simplicial Complex Degrees -----
# --------------------------------------------------

# EXAMPLE: Take the node for Danish language

# QUESTION: How many edges are incident to the node for Danish?

# First, join node data frame on edge data frame
node_edges <- left_join(x = nodes,
                        y = edges,
                        by = join_by(V1 == V1))

# Now, filter V1 on the string "Danish", and find number of rows
node_edges %>% 
  filter(V1 == "Danish") %>% 
  nrow()

# ANSWER: The node Danish is incident to 3 edges.

# QUESTION: How many triangles are incident to the node for Danish?

# First, join node data frame on edge data frame
node_triangles <- left_join(x = nodes,
                            y = triangles,
                            by = join_by(V1 == V1))

# Now, filter V1 on the string "Danish", and find number of rows
node_triangles %>% 
  filter(V1 == "Danish") %>% 
  nrow()

# ANSWER: The node Danish is incident to 2 triangles.

