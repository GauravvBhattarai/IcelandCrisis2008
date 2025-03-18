# Load necessary libraries
install.packages("igraph")
library(igraph)
library(ggplot2)
library(dplyr)

# Simple credit network model based on Delli Gatti et al. (2010)
create_financial_network <- function(n_banks = 3, n_firms = 10) {
  # Create an empty directed graph
  g <- make_empty_graph(n = n_banks + n_firms, directed = TRUE)
  
  # Set node types
  V(g)$type <- c(rep("bank", n_banks), rep("firm", n_firms))
  V(g)$name <- c(paste0("Bank", 1:n_banks), paste0("Firm", 1:n_firms))
  
  # Set initial net worth
  V(g)$net_worth <- runif(n_banks + n_firms, 1, 5)
  
  # Create connections (bank lending to firms)
  for(i in (n_banks+1):(n_banks+n_firms)) {
    # Each firm connects to 1-2 banks
    bank_count <- sample(1:min(2, n_banks), 1)
    banks <- sample(1:n_banks, bank_count)
    
    for(b in banks) {
      # Create edge from bank to firm with random weight
      g <- add_edges(g, c(b, i), weight = runif(1, 0.5, 2))
    }
  }
  
  # Create some inter-firm connections (supply chain)
  for(i in (n_banks+1):(n_banks+n_firms)) {
    if(runif(1) < 0.3) {  # 30% chance of supplying another firm
      supplier_to <- sample((n_banks+1):(n_banks+n_firms), 1)
      if(supplier_to != i) {
        g <- add_edges(g, c(i, supplier_to), weight = runif(1, 0.3, 1))
      }
    }
  }
  
  return(g)
}

# Simulate shock propagation
simulate_shock <- function(g, shocked_node, shock_magnitude = 0.5, steps = 3) {
  # Store initial values
  V(g)$initial_worth <- V(g)$net_worth
  
  # Apply initial shock
  V(g)[shocked_node]$net_worth <- V(g)[shocked_node]$net_worth * (1 - shock_magnitude)
  
  # Track changes over time
  worth_history <- matrix(0, nrow = vcount(g), ncol = steps + 1)
  worth_history[, 1] <- V(g)$net_worth
  
  # Propagate shock through network
  for(step in 1:steps) {
    for(e in E(g)) {
      from <- ends(g, e)[1]
      to <- ends(g, e)[2]
      weight <- E(g)[e]$weight
      
      # If source node lost value, impact connected nodes
      if(V(g)[from]$net_worth < V(g)[from]$initial_worth) {
        impact <- weight * 0.2 * (1 - V(g)[from]$net_worth/V(g)[from]$initial_worth)
        V(g)[to]$net_worth <- V(g)[to]$net_worth * (1 - impact)
      }
    }
    worth_history[, step + 1] <- V(g)$net_worth
  }
  
  # Calculate final impact
  V(g)$pct_change <- (V(g)$net_worth - V(g)$initial_worth) / V(g)$initial_worth * 100
  
  return(list(graph = g, history = worth_history))
}

# Create a financial network for analysis
set.seed(123)
network <- create_financial_network(n_banks = 3, n_firms = 8)

# Visualize network structure
plot(network, 
     vertex.color = ifelse(V(network)$type == "bank", "skyblue", "lightgreen"),
     vertex.size = 15,
     vertex.label = V(network)$name,
     edge.arrow.size = 0.5,
     main = "Financial Network Structure")

# Simulate shock to Bank1
result <- simulate_shock(network, shocked_node = 1, shock_magnitude = 0.7)
shocked_network <- result$graph

# Visualize impact
node_colors <- ifelse(V(shocked_network)$type == "bank", "skyblue", "lightgreen")
node_colors[V(shocked_network)$pct_change < -20] <- "red"
node_colors[V(shocked_network)$pct_change < -10 & V(shocked_network)$pct_change >= -20] <- "orange"

plot(shocked_network,
     vertex.color = node_colors,
     vertex.size = 15 * (1 + pmin(0, V(shocked_network)$pct_change)/200),
     vertex.label = paste0(V(shocked_network)$name, "\n", round(V(shocked_network)$pct_change, 1), "%"),
     edge.arrow.size = 0.5,
     main = "Network After Shock to Bank1")

# Create a barplot of impacts
impact_data <- data.frame(
  entity = V(shocked_network)$name,
  type = V(shocked_network)$type,
  impact = V(shocked_network)$pct_change
)

ggplot(impact_data, aes(x = reorder(entity, impact), y = impact, fill = type)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_minimal() +
  labs(title = "Impact of Bank1 Shock on Financial Network",
       x = "Entity",
       y = "Net Worth Change (%)",
       fill = "Entity Type")

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 600">
  <!-- Background -->
  <rect width="800" height="600" fill="#f8f9fa"/>
  
  <!-- Title -->
  <text x="400" y="40" font-family="Arial" font-size="24" text-anchor="middle" font-weight="bold">Iceland's Banking System Collapse 2008</text>
  
  <!-- Network visualization -->
  <!-- Central Bank of Iceland -->
  <circle cx="400" cy="120" r="40" fill="#9775fa" stroke="#333" stroke-width="2"/>
  <text x="400" y="115" font-family="Arial" font-size="14" text-anchor="middle" font-weight="bold" fill="white">Central Bank</text>
  <text x="400" y="135" font-family="Arial" font-size="12" text-anchor="middle" fill="white">of Iceland</text>
  
  <!-- Three major banks -->
  <circle cx="250" cy="250" r="45" fill="#ff6b6b" stroke="#333" stroke-width="2"/>
  <text x="250" y="245" font-family="Arial" font-size="16" text-anchor="middle" font-weight="bold" fill="white">Kaupthing</text>
  <text x="250" y="265" font-family="Arial" font-size="12" text-anchor="middle" fill="white">-100%</text>
  
  <circle cx="400" cy="300" r="45" fill="#ff6b6b" stroke="#333" stroke-width="2"/>
  <text x="400" y="295" font-family="Arial" font-size="16" text-anchor="middle" font-weight="bold" fill="white">Landsbanki</text>
  <text x="400" y="315" font-family="Arial" font-size="12" text-anchor="middle" fill="white">-100%</text>
  
  <circle cx="550" cy="250" r="45" fill="#ff6b6b" stroke="#333" stroke-width="2"/>
  <text x="550" y="245" font-family="Arial" font-size="16" text-anchor="middle" font-weight="bold" fill="white">Glitnir</text>
  <text x="550" y="265" font-family="Arial" font-size="12" text-anchor="middle" fill="white">-100%</text>
  
  <!-- Foreign banks -->
  <circle cx="150" cy="150" r="30" fill="#74c0fc" stroke="#333" stroke-width="2"/>
  <text x="150" y="145" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Foreign</text>
  <text x="150" y="160" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Bank 1</text>
  
  <circle cx="650" cy="150" r="30" fill="#74c0fc" stroke="#333" stroke-width="2"/>
  <text x="650" y="145" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Foreign</text>
  <text x="650" y="160" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Bank 2</text>
  
  <circle cx="100" cy="300" r="30" fill="#74c0fc" stroke="#333" stroke-width="2"/>
  <text x="100" y="295" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Foreign</text>
  <text x="100" y="310" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Bank 3</text>
  
  <circle cx="700" cy="300" r="30" fill="#74c0fc" stroke="#333" stroke-width="2"/>
  <text x="700" y="295" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Foreign</text>
  <text x="700" y="310" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Bank 4</text>
  
  <!-- Domestic firms -->
  <circle cx="200" cy="400" r="25" fill="#63e6be" stroke="#333" stroke-width="2"/>
  <text x="200" y="395" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Firm 1</text>
  <text x="200" y="410" font-family="Arial" font-size="9" text-anchor="middle">-75%</text>
  
  <circle cx="300" cy="450" r="25" fill="#63e6be" stroke="#333" stroke-width="2"/>
  <text x="300" y="445" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Firm 2</text>
  <text x="300" y="460" font-family="Arial" font-size="9" text-anchor="middle">-83%</text>
  
  <circle cx="400" cy="470" r="25" fill="#63e6be" stroke="#333" stroke-width="2"/>
  <text x="400" y="465" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Firm 3</text>
  <text x="400" y="480" font-family="Arial" font-size="9" text-anchor="middle">-62%</text>
  
  <circle cx="500" cy="450" r="25" fill="#63e6be" stroke="#333" stroke-width="2"/>
  <text x="500" y="445" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Firm 4</text>
  <text x="500" y="460" font-family="Arial" font-size="9" text-anchor="middle">-71%</text>
  
  <circle cx="600" cy="400" r="25" fill="#63e6be" stroke="#333" stroke-width="2"/>
  <text x="600" y="395" font-family="Arial" font-size="12" text-anchor="middle" font-weight="bold">Firm 5</text>
  <text x="600" y="410" font-family="Arial" font-size="9" text-anchor="middle">-68%</text>
  
  <!-- IMF -->
  <rect x="350" y="520" width="100" height="50" fill="#ffa94d" stroke="#333" stroke-width="2"/>
  <text x="400" y="550" font-family="Arial" font-size="14" text-anchor="middle" font-weight="bold">IMF</text>
</svg>
