# Use Functions
cacl_mean_bill <- function(island_name){
  filtered_data <- subset(na.omit(data), species=="Adelie" & island == island_name)
  mean_bill_length <- mean(as.numeric(filtered_data$bill_length_mm),na.rm=T)
  return(round(mean_bill_length,2))
}


create_scatterplot <- function(data,selected_species,selected_island){
  
  # Filter the data for the specified species and island
  
  filtered_data <- data %>% 
    na.omit() %>% 
    filter(species==selected_species,island == selected_island)
  
  
  # Create the scatterplot
  
  plot <- ggplot(
    filtered_data,
    aes(x=bill_length_mm, y=bill_depth_mm,color=species, shape = species)
  )+
    geom_point()+
    labs(
      x = "Bill Length (mm)",
      y = "Bill Depth (mm)",
      title = paste("Penguin Bill Dimensions -", selected_species, "-", selected_island)
    )
  return(plot)
}