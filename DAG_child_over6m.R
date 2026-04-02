# DAG: Helminth infection -> Childhood stunting (children >6 months DAG)
# Method: ESC-DAGs
# Associated paper: Gabain et al. (2025) Phil Trans R Soc B
# https://doi.org/10.1098/rstb.2025.0040

library(DiagrammeR)

child_over6_graph_code <- "
digraph dag {
    node [shape = box, style = filled, color = lightblue, fontsize = 30];
    
    # Highlight exposure and outcome with bold font
    \"Helminth infection\" [fontname = \"Helvetica-Bold\"];
    \"Childhood stunting\" [fontname = \"Helvetica-Bold\"];
    
    # Base nodes (not repeating the bold ones)
    \"Anthelmintic treatment\"; \"Birth weight\";
    \"Mid-parental height\"; \"EED\"; \"Systemic inflammation\"; \"Micronutrient status\";
    \"Wasting\"; \"Anaemia\"; \"Diarrhoea\"; \"Macronutrient status\"; \"Age\";
    \"Dietary intake\"; \"Sex\"; \"SES\"; \"Other infections\"; \"Geographical location\"; \"WASH\";
    \"Healthcare access\"; \"Parental education\"; \"Ethnicity\"; \"Microbiome\";

    # Edges with appropriate styling - preserving original order
    \"Helminth infection\" -> \"Childhood stunting\" [color=red];  # #1 - Bidirectional
    \"Anthelmintic treatment\" -> \"Helminth infection\";
    \"Birth weight\" -> \"Childhood stunting\";
    \"Mid-parental height\" -> \"Childhood stunting\";
    \"Helminth infection\" -> \"EED\";
    \"EED\" -> \"Systemic inflammation\";
    \"EED\" -> \"Micronutrient status\" [color=red];  # #7 - Bidirectional
    \"Helminth infection\" -> \"Wasting\" [color=red];  # #8 - Bidirectional
    \"Systemic inflammation\" -> \"Macronutrient status\";
    \"Helminth infection\" -> \"Anaemia\";
    \"Anaemia\" -> \"Childhood stunting\";
    \"Sex\" -> \"Anaemia\";
    \"Micronutrient status\" -> \"Anaemia\";
    \"Systemic inflammation\" -> \"Anaemia\";
    \"Helminth infection\" -> \"Diarrhoea\";
    \"Diarrhoea\" -> \"Macronutrient status\";
    \"Diarrhoea\" -> \"Micronutrient status\" [color=red];  # #17 - Bidirectional
    \"Age\" -> \"Helminth infection\";
    \"Helminth infection\" -> \"Macronutrient status\" [color=red];  # #19 - Bidirectional
    \"Dietary intake\" -> \"Macronutrient status\";
    \"Macronutrient status\" -> \"Childhood stunting\";
    \"Helminth infection\" -> \"Micronutrient status\" [color=red];  # #22 - Bidirectional
    \"Dietary intake\" -> \"Micronutrient status\";
    \"Micronutrient status\" -> \"Systemic inflammation\" [color=red];  # #24 - Bidirectional
    \"Micronutrient status\" -> \"Childhood stunting\";
    \"Helminth infection\" -> \"Dietary intake\";
    \"Sex\" -> \"Dietary intake\";
    \"SES\" -> \"Dietary intake\";
    \"Systemic inflammation\" -> \"Childhood stunting\";
    \"Helminth infection\" -> \"Systemic inflammation\";
    \"Other infections\" -> \"Systemic inflammation\";
    \"Wasting\" -> \"Childhood stunting\";
    \"Other infections\" -> \"Wasting\" [color=red];  # #33 - Bidirectional
    \"Geographical location\" -> \"WASH\";
    \"Geographical location\" -> \"Healthcare access\";
    \"Geographical location\" -> \"Other infections\";
    \"Geographical location\" -> \"Helminth infection\";
    \"Parental education\" -> \"SES\";
    \"SES\" -> \"WASH\";
    \"SES\" -> \"Healthcare access\";
    \"SES\" -> \"Other infections\";
    \"SES\" -> \"Helminth infection\";
    \"Parental education\" -> \"WASH\";
    \"Parental education\" -> \"Healthcare access\";
    \"Parental education\" -> \"Other infections\";
    \"Parental education\" -> \"Helminth infection\";
    \"Ethnicity\" -> \"WASH\";
    \"WASH\" -> \"Other infections\";
    \"WASH\" -> \"Helminth infection\";
    \"Healthcare access\" -> \"Other infections\";
    \"Healthcare access\" -> \"Birth weight\";
    \"Healthcare access\" -> \"Helminth infection\";
    \"Healthcare access\" -> \"Anaemia\";
    \"Sex\" -> \"Other infections\";
    \"Sex\" -> \"Helminth infection\";
    \"Sex\" -> \"Birth weight\";
    \"Age\" -> \"Other infections\";
    \"Helminth infection\" -> \"Other infections\" [color=red];  # #57 - Bidirectional
    \"Other infections\" -> \"Childhood stunting\";
    \"Birth weight\" -> \"Helminth infection\";
    \"Other infections\" -> \"Macronutrient status\" [color=red];  # #60 - Bidirectional
    \"Other infections\" -> \"Micronutrient status\" [color=red];  # #61 - Bidirectional
    \"Other infections\" -> \"EED\";
    \"Other infections\" -> \"Anaemia\";
    \"Healthcare access\" -> \"Diarrhoea\";
    \"Other infections\" -> \"Diarrhoea\";
    \"Geographical location\" -> \"Dietary intake\";
    \"Parental education\" -> \"Dietary intake\";
    \"Ethnicity\" -> \"Dietary intake\";
    \"Age\" -> \"Dietary intake\";
    \"Other infections\" -> \"Dietary intake\";
    \"Birth weight\" -> \"Wasting\";
    \"Helminth infection\" -> \"Microbiome\" [color=red];  # #72 - Bidirectional
    \"Dietary intake\" -> \"Microbiome\";
    \"Microbiome\" -> \"Micronutrient status\" [color=red];  # #74 - Bidirectional
    \"Microbiome\" -> \"Macronutrient status\" [color=red];  # #75 - Bidirectional
    \"Microbiome\" -> \"EED\" [color=red];  # #76 - Bidirectional
    \"Microbiome\" -> \"Systemic inflammation\" [color=red];  # #77 - Bidirectional
    \"Diarrhoea\" -> \"Microbiome\" [color=red];  #  - Bidirectional
    \"Other infections\" -> \"Microbiome\" [color=red];  # #78 - Bidirectional
    
    # New from expert review
    \"Diarrhoea\" -> \"EED\";
    \"EED\" -> \"Macronutrient status\" [color=red];
    
    # New node: food security
    \"Geographical location\" -> \"Food security\";  
    \"SES\" -> \"Food security\"; 
    \"Parental education\" -> \"Food security\";
    \"Food security\" -> \"Dietary intake\"; 
}
"


